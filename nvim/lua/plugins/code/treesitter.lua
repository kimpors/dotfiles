return {
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = SERVER_LANGS.types,
      highlight = { enable = true },
			autotag = { enable = true },
			sync_install = true,
		})
	end,
}
