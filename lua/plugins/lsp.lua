return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"antosha417/nvim-lsp-file-operations",
		},
		config = function()
			local lspConfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- start up file operation support
			require("lsp-file-operations").setup()

			-- Lua lsp configuration
			lspConfig.lua_ls.setup({
				filetypes = { "lua" },
				capabilities = capabilities,
			})

			-- Python lsp configuration
			lspConfig.pyright.setup({
				filetypes = { "python" },
				capabilities = capabilities,
			})

			-- Rust lsp configuration
			lspConfig.rust_analyzer.setup({
				filetypes = { "rust" },
				capabilities = capabilities,
			})

			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
