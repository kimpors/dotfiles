return {
	"glepnir/dashboard-nvim",

  lazy = true,
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			change_to_vcs_root = true,
			config = {
				week_header = { enable = true },
				packages = { enable = false },
				project = { enable = false },
				mru = { limit = 5, label = "Recent" },
				disable_move = true,

				shortcut = {
					{ desc = "Lazy", key = "L", action = "Lazy" },
					{ desc = "Mason", key = "M", action = "Mason" },
				},
				footer = {},
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
