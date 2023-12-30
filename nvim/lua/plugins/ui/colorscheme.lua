return {
	"catppuccin/nvim",
	name = "catppuccin",

  lazy = false,
  priority = 1000,
	dependencies = {
    "nvim-tree/nvim-web-devicons",
	  "glepnir/dashboard-nvim",
		"nvim-lualine/lualine.nvim",
	},
	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				noice = true,
				dashboard = true,
				markdown = true,
				mason = true,
				lsp_saga = true,
				dap = {
					enabled = true,
					enable_ui = true,
				},
				telescope = {
					enabled = true,
				},
				native_lsp = {
					enabled = true,
				},
			},
		})

		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
