return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
			"mfussenegger/nvim-dap-python",
			"suketa/nvim-dap-ruby",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
			-- rails/ruby debugging expects the `debug` gem (rdbg) in the project bundle
			require("dap-ruby").setup()

			-- open/close the ui with the debug session
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Debug keymaps (Leader + d namespace)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { desc = desc })
			end
			map("<leader>db", dap.toggle_breakpoint, "[D]ebug toggle [B]reakpoint")
			map("<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, "[D]ebug conditional [B]reakpoint")
			map("<leader>dc", dap.continue, "[D]ebug [C]ontinue/start")
			map("<leader>di", dap.step_into, "[D]ebug step [I]nto")
			map("<leader>do", dap.step_over, "[D]ebug step [O]ver")
			map("<leader>dO", dap.step_out, "[D]ebug step [O]ut")
			map("<leader>dr", dap.repl.toggle, "[D]ebug [R]EPL")
			map("<leader>dl", dap.run_last, "[D]ebug run [L]ast")
			map("<leader>dt", dap.terminate, "[D]ebug [T]erminate")
			map("<leader>du", dapui.toggle, "[D]ebug toggle [U]I")
		end,
	},
}
