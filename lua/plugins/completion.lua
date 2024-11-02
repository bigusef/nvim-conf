return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "nvim_lsp" },
				-- { name = "vsnip" }, -- For vsnip users.
				-- { name = 'luasnip' }, -- For luasnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
			}), --
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						path = "[Path]",
						nvim_lsp = "[LSP]",
						-- luasnip = "[LuaSnip]",
						-- nvim_lua = "[Lua]",
						-- latex_symbols = "[Latex]",
					},
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			completion = { completeopt = "menu,menuone,noinsert" },
		})
	end,
}
