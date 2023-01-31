return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    keys = {
        { "<s-TAB>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
        require("neo-tree").setup({ filesystem = { bind_to_cwd = false }})
    end,
}
