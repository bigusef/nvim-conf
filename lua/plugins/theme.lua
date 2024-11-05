return {
    {
        "catppuccin/nvim",
        Lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    {
        "nvim-lualine/Lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local lazy_status = require("lazy.status") -- to configure lazy pending updates count

            require("lualine").setup({
                options = {
                    theme = "dracula",
                },
                sections = {
                    lualine_x = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#ff9e64" },
                        },
                        { "encoding" },
                        { "fileformat" },
                        { "filetype" },
                    },
                },
            })
        end,
    },
}
