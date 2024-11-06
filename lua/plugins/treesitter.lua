return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = { "lua", "python", "rust", "sql" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
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
