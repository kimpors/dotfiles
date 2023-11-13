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
		"cs",
		"html",
		"css",
		"json",
		"javascript",
		"c",
		"python",
	},
}

require("lazy").setup({
	{
    { import = "plugins.ui" },
    { import = "plugins.code" },
    { import = "plugins.code.lsp" },
	},
})
