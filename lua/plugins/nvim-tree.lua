local github = function(x) return 'https://github.com/' .. x end

vim.pack.add {
     { src = github 'nvim-tree/nvim-web-devicons' }
    ,{ src = github 'nvim-tree/nvim-tree.lua' }
}


require 'nvim-tree' .setup {
  create_in_closed_folder = false,
  disable_netrw       = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  respect_buf_cwd     = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    side = 'left',
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    icons = {
      padding = ' ',
      symlink_arrow = ' >> ',
      show = { 
        git = true, 
        file = true,
        folder = true,
        folder_arrow = true 
      },
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = 's',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌'
        },
        folder = {
          arrow_open = '',
          arrow_closed = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        }
      }
    },
    highlight_opened_files = 'icon',
    highlight_git = true,
    root_folder_modifier = ':~',
    special_files = { 'Cargo.toml', 'readme.md', 'Readme.md', 'README.MD', 'README.md', 'Makefile', 'MAKEFILE', 'build.zig' }
  }
}

