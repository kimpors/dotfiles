return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

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
