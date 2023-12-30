return {
	"williamboman/mason-lspconfig.nvim",

  lazy = true,
  cmd = "Mason",
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = SERVER_LANGS.names,
			automatic_installation = true,
		})
	end,
}
