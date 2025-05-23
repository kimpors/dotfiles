return {
	{ "nvim-lua/plenary.nvim", lazy = true },

-- support for autopair
	{
		"windwp/nvim-autopairs",

		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},

-- terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true
	},

-- math
	{
		"jbyuki/nabla.nvim"
	},


-- leetcode
	{
		"kawre/leetcode.nvim",
		cmd = "Leet",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lang = "c",
			storage = {
				home = "/home/kimpors/project/leetcode/",
				cache = "/home/kimpors/.local/share/leetcode/",
			}
		},
	},

-- completion
	{
	  'saghen/blink.cmp',
	  ft = { "lua", "cmake", "cpp" },
	  opts = {
		enabled = function()
			return not vim.tbl_contains({ "c" }, vim.bo.filetype)
		end,
		keymap = { preset = "super-tab" },
		fuzzy = { implementation = "lua" }
	  },
	},

-- fuzzy finder support
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",

		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
			{ "<leader>fp", "<cmd>Telescope project<cr>" },
		},
		dependencies = {
			{ "nvim-telescope/telescope-project.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({

				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							height = 0.9,
							width = 0.9,
							preview_cutoff = 0,
							preview_width = 0.7,
							prompt_position = "bottom",
						},
					},
					mappings = {
						n = {
							["q"] = "close",
						},
					},
				},
				extensions = {
					project = {
						base_dirs = {
							{ path = "~/project", max_depth = 4 },
						},

						theme = "dropdown",
						order_by = "asc",
						sync_with_nvim_tree = true,
					},
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("project")
		end,
	},

-- add git support
	{
		"lewis6991/gitsigns.nvim",

		event = "InsertEnter",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true
			})
		end,
	},

-- add wrap selection
	{
		"kylechui/nvim-surround",
		version = "*",

		event = "InsertEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},

-- add highlight support
	{
		"nvim-treesitter/nvim-treesitter",

		event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {},
				highlight = { enable = true },
				autotag = { enable = true },
				sync_install = true,
			})
		end,
	},

-- for neorg
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},

-- for note taking
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },

		cmd = "Neorg",
		build = ":Neorg sync-parsers",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.summary"] = {},
					["core.concealer"] = {},
					["core.keybinds"] = {
						config = {
							hook = function(keybinds)
								keybinds.map("norg", "n", "q", function()
									vim.cmd("Neorg return")

									if string.len(vim.fn.expand("%")) == 0 then
										vim.cmd("Dashboard")
									end
								end)
							end,
						},
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
				},
			})
		end,
	},

-- file browser
	{
		"stevearc/oil.nvim",

		lazy = false,
		config = function()
			require("oil").setup({
				keymaps = {
					["o"] = "actions.select",
					["O"] = "actions.parent",
					["p"] = "actions.preview",
					["~"] = "actions.open_cwd",
					["."] = "actions.toggle_hidden",
					["q"] = "actions.close",
				},
			})
		end,
	},
}
