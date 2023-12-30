return {
	"nvim-treesitter/nvim-treesitter",

  ft = SERVER_LANGS.types,
	dependencies = {
    "windwp/nvim-ts-autotag",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = SERVER_LANGS.treesitter,
      highlight = { enable = true },
			autotag = { enable = true },
			sync_install = true,
		})
	end,
}
