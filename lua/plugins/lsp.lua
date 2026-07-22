return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"antosha417/nvim-lsp-file-operations",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- keymaps and per-buffer behavior for every attached LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>ld", require("telescope.builtin").lsp_type_definitions, "[L]SP Type [D]efinition")
				map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[L]SP Document [S]ymbols")
				map(
					"<leader>lw",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					"[L]SP [W]orkspace Symbols"
				)
				map("<leader>lr", vim.lsp.buf.rename, "[L]SP [R]ename")
				map("<leader>la", vim.lsp.buf.code_action, "[L]SP Code [A]ction", { "n", "x" })

				-- highlight other references of the word under the cursor on hold
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})

		-- broadcast cmp capabilities to every server
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- per-server overrides, on top of the defaults nvim-lspconfig ships in lsp/
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		-- ruff owns linting/imports/formatting for python, pyright owns types
		vim.lsp.config("pyright", {
			settings = {
				pyright = {
					disableOrganizeImports = true,
				},
			},
		})
		vim.lsp.config("ruff", {
			on_attach = function(client)
				client.server_capabilities.hoverProvider = false
			end,
		})

		-- rename support for neo-tree file operations
		require("lsp-file-operations").setup()

		-- mason package names (not lspconfig names); tree-sitter-cli is used by nvim-treesitter
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"pyright",
				"ruff",
				"jdtls",
				"vscode-spring-boot-tools",
				"java-debug-adapter",
				"java-test",
				"ruby-lsp",
				"rubocop",
				"debugpy",
				"stylua",
				"tree-sitter-cli",
			},
		})

		-- automatic_enable calls vim.lsp.enable() for every mason-installed server, except:
		-- stylua/rubocop run as formatters (conform / ruby-lsp), jdtls is started by nvim-jdtls
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = { "stylua", "rubocop", "jdtls" },
			},
		})
	end,
}
