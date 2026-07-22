return {
	"tpope/vim-sleuth",
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			-- async, skips already-installed parsers
			require("nvim-treesitter").install({
				"bash",
				"c",
				"css",
				"diff",
				"dockerfile",
				"embedded_template",
				"gitcommit",
				"groovy",
				"html",
				"java",
				"javascript",
				"json",
				"kotlin",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"properties",
				"python",
				"query",
				"regex",
				"ruby",
				"rust",
				"sql",
				"toml",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			})

			-- enable highlighting + indentation for any buffer with an installed parser
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
				callback = function(event)
					if pcall(vim.treesitter.start, event.buf) then
						vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
	},
	{
		"numtostr/comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			padding = true,
		},
	},
}
