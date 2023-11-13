return {
	"nvim-tree/nvim-tree.lua",

	keys = {{ "<leader>e", "<cmd>NvimTreeToggle<cr>" }},
  dependencies = { "nvim-lualine/lualine.nvim" },

	config = function()
		require("nvim-tree").setup({
			update_cwd = true,
			filters = { dotfiles = true },
		})
	end,
}
