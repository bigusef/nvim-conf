return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ruff", "rust_analyzer" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "antosha417/nvim-lsp-file-operations"
        },
        config = function()
            local lspConfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- start up file operation support
            require("lsp-file-operations").setup()

            -- Lua lsp configuration
            lspConfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- Python lsp configuration
            lspConfig.ruff.setup({
                capabilities = capabilities,
            })

            -- Rust lsp configuration
            lspConfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
