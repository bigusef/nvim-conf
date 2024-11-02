return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local builtin = require("telescope.builtin")
            local keymap = vim.keymap

            keymap.set(
                "n",
                "<C-p>",
                builtin.find_files,
                { desc = "Telescope find files", noremap = true, silent = true }
            )
            keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Telescope live grep", noremap = true, silent = true })
            keymap.set(
                "n",
                "<leader>ft",
                "<cmd>TodoTelescope<cr>",
                { desc = "Telescope find TODO", noremap = true, silent = true }
            )
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown({}) } },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
