return {
	"rcarriga/nvim-dap-ui",

	keys = {
		{ "<f5>", "<cmd>DapContinue<cr>" },
		{ "<leader>dn", "<cmd>DapStepOver<cr>" },
		{ "<leader>di", "<cmd>DapStepInfo<cr>" },
		{ "<leader>do", "<cmd>DapStepOut<cr>" },
		{ "<leader>dx", "<cmd>DapTerminate<cr>" },
		{ "<leader>b", "<cmd>DapToggleBreakPoint<cr>" },
	},
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup({
			layouts = {
				{
					size = 0.25,
					position = "left",
					elements = {
						"scopes",
						"stacks",
						"breakpoints",
					},
				},
				{
					size = 0.25,
					position = "bottom",
					elements = {
						"repl",
						"watches",
					},
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
