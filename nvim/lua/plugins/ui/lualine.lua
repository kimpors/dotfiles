return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "catppuccin/nvim", "nvim-tree/nvim-web-devicons" },

    lazy = false,
    priority = 999,
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					globalstatus = true,
					component_separators = { left = "󰍟", right = "󰍞" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
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
}
