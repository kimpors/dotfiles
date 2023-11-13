return {
	"mfussenegger/nvim-dap",

	lazy = true,
	config = function()
		local dap = require("dap")

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode",
		}

		dap.adapters.coreclr = {
			type = "executable",
			command = "/usr/bin/netcoredbg/netcoredbg",
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				name = "Launch",
				type = "coreclr",
				request = "launch",
				program = function()
					-- get dll path
					local path = vim.fn.getcwd() .. "/bin/Debug/net7.0/"
					local handle = io.popen("ls " .. path)
					local result = handle:read("*a")
					handle:close()

					return path .. result:match("[%a%d]*.dll")
				end,
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				env = function()
					local variables = {}
					for k, v in pairs(vim.fn.environ()) do
						table.insert(variables, string.format("%s=%s", k, v))
					end
					return variables
				end,
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end,
}
