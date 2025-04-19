return {
	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

	-- ui components
	{ "rcarriga/nvim-notify", lazy = true },

	-- support for colors
	{
		"NvChad/nvim-colorizer.lua",

		ft = { "css", "html", "javascript" },
		config = function()
			require("colorizer").setup({ filetypes = { "css", "html", "javascript" } })
		end,
	},

	-- ui replacment for messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",

		event = "VeryLazy",
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})
		end,
	},

	-- startup screen
	{
		"glepnir/dashboard-nvim",

		event = "VimEnter",
		opts = function()
			local logo = [[
╔─────────────────────────────────────────────────────────────────────────╗
│                                                                         │
│                                                                         │
│                                                ███                      │
│                                               ░░░                       │
│      ████████    ██████   ██████  █████ █████ ████  █████████████       │
│     ░░███░░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███      │
│      ░███ ░███ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███      │
│      ░███ ░███ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███      │
│      ████ █████░░██████ ░░██████   ░░█████    █████ █████░███ █████     │
│     ░░░░ ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░      │
│                                                                         │
│                                                                         │
╚─────────────────────────────────────────────────────────────────────────╝
      		]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
					center = {
						{ action = "Telescope project", desc = " Projects", icon = " ", key = "p" },
						{ action = "Neorg index", desc = " Notes", icon = " ", key = "n" },
						{ action = "Lazy", desc = " Lazy", icon = " ", key = "l" },
						{ action = "qa", desc = " Quit", icon = " ", key = "q" },
					},
					footer = {},
				},
			}

			return opts
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",

		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus

			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,

		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					globalstatus = true,
					component_separators = { left = "󰍟", right = "󰍞" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "dashboard" },
						"TelescopePrompt",
						"lazy",
						"norg",
						"term",
						"oil",
						"checkhealth",
						"help",
						"gitcommit",
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "diagnostics" },
					lualine_x = {},
					lualine_y = { "filesize", "filetype" },
					lualine_z = { "progress" },
				},
			})
		end,
	},

	-- debugger ui
	{
		"rcarriga/nvim-dap-ui",

		keys = {
			{ "<f5>", "<cmd>DapContinue<cr>" },
			{ "<leader>dn", "<cmd>DapStepOver<cr>" },
			{ "<leader>di", "<cmd>DapStepInto<cr>" },
			{ "<leader>do", "<cmd>DapStepOut<cr>" },
			{ "<leader>dx", "<cmd>DapTerminate<cr>" },
			{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>" },
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
	},
}
