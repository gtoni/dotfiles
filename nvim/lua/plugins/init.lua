return {
    "nvim-lua/plenary.nvim",
    {
        "folke/which-key.nvim", enabled = true,
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    "MunifTanjim/nui.nvim",
    "airblade/vim-gitgutter"
}
