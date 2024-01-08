return {
	"catppuccin/nvim",
	name = "catppuccin",

  lazy = false,
  priority = 1000,
	dependencies = {
    "nvim-tree/nvim-web-devicons",
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
