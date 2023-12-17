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
		"pyright",
	},

	types = {
		"lua",
		"c_sharp",
		"html",
		"css",
		"json",
		"tsx",
		"javascript",
		"typescript",
		"c",
		"python",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
	},
}

require("lazy").setup({
	{
		{ import = "plugins.ui" },
		{ import = "plugins.code" },
		{ import = "plugins.code.lsp" },
	},
})
