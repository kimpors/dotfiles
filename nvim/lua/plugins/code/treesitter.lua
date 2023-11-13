return {
	"nvim-treesitter/nvim-treesitter",

  ft = {
    "lua",
    "html",
    "css",
    "json",
    "gitcommit",
    "gitignore",
    "git_rebase",
    "gitattributes",
    "markdown",
    "markdown_inline",
    "vim",
    "vimdoc",
    "regex",
    "bash",
  },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = ft,
      highlight = { enable = true },
			autotag = { enable = true },
			sync_install = true,
		})
	end,
}
