return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-neotest/neotest-python",
			"olimorris/neotest-rspec",
			"zidhuss/neotest-minitest",
		},
		-- java tests run through jdtls instead (see ftplugin/java.lua)
		keys = {
			{
				"<leader>Tt",
				function()
					require("neotest").run.run()
				end,
				desc = "[T]est nearest [T]est",
			},
			{
				"<leader>Tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "[T]est [F]ile",
			},
			{
				"<leader>Ta",
				function()
					require("neotest").run.run(vim.uv.cwd())
				end,
				desc = "[T]est [A]ll in project",
			},
			{
				"<leader>Td",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "[T]est nearest with [D]ebugger",
			},
			{
				"<leader>Ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "[T]est [S]ummary",
			},
			{
				"<leader>To",
				function()
					require("neotest").output.open({ enter = true, auto_close = true })
				end,
				desc = "[T]est [O]utput",
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({ dap = { justMyCode = false } }),
					require("neotest-rspec"),
					require("neotest-minitest"),
				},
			})
		end,
	},
}
