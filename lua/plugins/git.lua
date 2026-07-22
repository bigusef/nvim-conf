return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local map = function(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
				end

				-- Hunk navigation ([/] convention), falls back to builtin [c/]c in diff mode
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Next git hunk")
				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Previous git hunk")

				-- Git operations (Leader + g namespace)
				map("n", "<leader>gs", gitsigns.stage_hunk, "[G]it [S]tage hunk")
				map("n", "<leader>gr", gitsigns.reset_hunk, "[G]it [R]eset hunk")
				map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "[G]it [S]tage selection")
				map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "[G]it [R]eset selection")
				map("n", "<leader>gp", gitsigns.preview_hunk, "[G]it [P]review hunk")
				map("n", "<leader>gb", gitsigns.blame_line, "[G]it [B]lame line")
				map("n", "<leader>gd", gitsigns.diffthis, "[G]it [D]iff against index")

				-- Toggle namespace
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "[T]oggle git [B]lame line")
			end,
		},
	},
}
