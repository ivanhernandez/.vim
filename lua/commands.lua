
vim.api.nvim_create_user_command(
    'ChangeToCurrentBufferDirectory',
	'cd %:p:h',
	{});
vim.cmd('cabbrev cdc ChangeToCurrentBufferDirectory')



vim.g.curswtheme = "default"
function switchDarkLightThemes()
  if vim.g.curswtheme == 'default' then
    vim.g.curswtheme = 'light'
    vim.o.background = 'light'
    vim.cmd [[colorscheme pompeii]]
    vim.cmd [[redraw]]
  elseif vim.g.curswtheme == "light" then
    vim.g.curswtheme = 'dark'
    vim.o.background = 'dark'
    vim.cmd [[colorscheme pompeii]]
    vim.cmd [[redraw]]
  else 
    vim.g.curswtheme = 'default'
    vim.o.background = 'dark'
    vim.cmd [[colorscheme bogster]]
    vim.cmd [[redraw]]
  end
end


--[[ TODO
function! SynStack()
    if !exists("*synstack")
        echoerr "Not available. Unsupported 'syntack'."
        return
    endif
    let stack = synstack(line('.'), col('.'))
    if len(stack) == 0
        echo "No syntax group under cursor."
        return
    endif
    let chainTail = synIDattr(synIDtrans(stack[-1]), "name")
    let chain = map(stack, 'synIDattr(v:val, "name")')
    echo join(chain, "->") . "=>" . chainTail
endfunc
]]--

function ChangeFontSize(changeAmount)
   local font = vim.o.guifont
   local i, _ = string.find(font, ":h")

   local fontsize = tonumber(string.sub(font, i+2))
   local fontname = string.sub(font, 0, i+1)

   local newfontsize = fontsize + changeAmount
   local newfont=fontname .. tostring(newfontsize)

   vim.o.guifont = newfont
end
