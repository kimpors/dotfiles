return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",

		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
			{ "<leader>fp", "<cmd>Telescope project<cr>" },
			{ "<leader>fe", "<cmd>Telescope file_browser<cr>" },
		},
		dependencies = {
      { "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-project.nvim" },
		  { "nvim-telescope/telescope-file-browser.nvim" },
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
							["o"] = "select_tab",
						},
					},
				},
				extensions = {
					file_browser = {},
					project = {
						theme = "dropdown",
						order_by = "asc",
						sync_with_nvim_tree = true,
					},
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("project")
			require("telescope").load_extension("file_browser")
		end,
	},
}
