require("plugins-setup")

SERVER_LANGS = {
	lsp = {
		"lua_ls",
		"csharp_ls",
		"html",
		"cssls",
		"jsonls",
		"tsserver",
		"clangd",
	},

	treesitter = {
		"lua",
    "norg",
    "norg_meta",
    "vim",
    "regex",
    "bash",
    "markdown",
    "markdown_inline",
		"c",
		"c_sharp",
		"html",
		"css",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"git_config",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"gitattributes",
	},
}

require("lazy").setup("plugins")
