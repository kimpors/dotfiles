return {
	"NvChad/nvim-colorizer.lua",

	ft = { "css", "html", "javascript" },
	config = function()
		require("colorizer").setup({
			filetypes = ft,
		})
	end,
}
