local colors = {
  black        = '#282828',
  white        = '#FFFFFF',
  red          = '#D71D00',
  blue         = '#3787D7',
  lightblue    = '#5FAFFF',
  yellow       = '#F7AF04',
  darkgray     = '#232323',
  gray         = '#2C2C2C',
  lightgray  = '#3A3A3A'
}

local custom_codedark = {
  normal = {
    a = {bg = colors.blue, fg = colors.white, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.lightgray, fg = colors.lightblue, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  command = {
    a = {bg = colors.blue, fg = colors.white, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.white, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.white}
  }
}

return {
    {
        "nvim-lualine/lualine.nvim", enabled = true,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    --component_separators = { left = '', right = ''},
                    --section_separators = { left = '', right = ''},
                    --
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                    --section_separators = { left = '', right = '' },

                    icons_enabled = true,
                    theme = custom_codedark,
                    --component_separators = '|',
                    --section_separators = { left = '', right = '' }
				},
				sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch', 'diff',
						{					
							'diagnostics',
							symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
						}
					},
					lualine_c = {'filename'},
					lualine_x = {'encoding', 'fileformat', 'filetype'},
					lualine_y = {'progress'},
					lualine_z = {'location'}
				}
            })
        end
    },
    {
        "vim-airline/vim-airline", enabled = true,
        dependencies = { 
            "ryanoasis/vim-devicons",
            "nvim-tree/nvim-web-devicons" 
        },
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd([[
                let g:airline#extensions#tabline#enabled = 1
                let g:airline#extensions#tabline#formatter = 'unique_tail'

                let g:airline#extensions#tabline#left_sep = ''
                let g:airline#extensions#tabline#left_alt_sep = ''

                let g:airline_powerline_fonts = 1
                let g:airline_disable_statusline = 1
            ]])
        end
    }
}
