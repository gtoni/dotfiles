function opts_project_git_root()
    local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")

        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
    end

    if is_git_repo() then
        return {
            cwd = get_git_root(),
        }
    end

    return {}
end

function find_files_git()
    local opts = opts_project_git_root()
    require("telescope.builtin").find_files(opts)
end

function live_grep_git()
    local opts = opts_project_git_root()
    require("telescope.builtin").live_grep(opts)
end

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local action_layout = require('telescope.actions.layout')
        require("telescope").setup({
            defaults = {
                mappings = {
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview
                    },
                    i = {
                        ["<M-p>"] = action_layout.toggle_preview
                    },
                },
            },
            pickers = {
                find_files = {
                    previewer = false
                },
                live_grep = {
                    previewer = false
                }
            }
        })
    end,
    init = function()
        vim.cmd([[
            nnoremap <leader>ff :execute 'Telescope find_files'<cr>
            nnoremap <leader>fg :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>
            nnoremap <leader>fb :execute 'Telescope buffers'<cr>
            nnoremap <leader>fh :execute 'Telescope help_tags'<cr>
        ]])
    end
}
