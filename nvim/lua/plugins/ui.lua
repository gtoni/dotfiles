return {
    { "ryanoasis/vim-devicons", lazy = false },
    {
        "nvim-tree/nvim-web-devicons", lazy = false,
        config = function()
            require("nvim-web-devicons").setup()
        end
    },
    {
        "gtoni/vim-code-dark",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.codedark_transparent = 1
            vim.cmd([[
                colorscheme codedark
            ]])
            vim.cmd([[highlight clear CursorLine]])
        end
    }
}
