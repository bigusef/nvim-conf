return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = { "lua", "python", "rust", "sql" },
			sync_install = true,
			auto_install = true,
		})
	end,
}
