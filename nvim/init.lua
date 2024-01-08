require("plugins-setup")

SERVER_LANGS = {
	names = {
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

require("lazy").setup({
	{
		{ import = "plugins" },
	},
})
