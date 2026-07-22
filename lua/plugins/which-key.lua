return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>b", group = "[B]uffer" },
			{ "<leader>g", group = "[G]it", mode = { "n", "v" } },
			{ "<leader>l", group = "[L]SP" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]oggle" },
		},
	},
}
