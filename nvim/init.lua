require("plugins-setup")

SERVER_LANGS = {
lsp = { "clangd" },
	treesitter = {

	"lua",
        "norg",
        "vim",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
		"c",
		"json",
		"git_config",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"gitattributes",
	},
}

require("lazy").setup("plugins")
