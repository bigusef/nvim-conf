return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "ui-select")

		-- plugin keymaps
		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<A-p>", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<A-f>", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earsh existing [B]uffers" })
		vim.keymap.set("n", "<leader>se", builtin.resume, { desc = "[S]earch R[e]sume" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "[S]earch [R]ecent Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>,", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
