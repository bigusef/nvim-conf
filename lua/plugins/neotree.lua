return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_by_name = {
                        ".git",
                        "node_modules",
                        "target",
                    },
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
            },
            window = {
                mappings = {
                    ["L"] = "open_nofocus",
                },
            },
            commands = {
                open_nofocus = function(state)
                    require("neo-tree.sources.filesystem.commands").open(state)
                    vim.schedule(function()
                        vim.cmd([[Neotree focus]])
                    end)
                end,
            },
        })

        -- vim.keymap.set("n", "<A-e>", ":Neotree toggle<CR>", { desc = "File [E]xploer ", noremap = true, silent = true })
    end,
}
