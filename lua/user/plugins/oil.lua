-- GOAT of file manager

return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>e",
			function()
				require("oil").toggle_float()
			end,
			desc = "Oil File Explorer",
		},
	},
	config = function()
		require("oil").setup({
			keymaps = {
				["h"] = "actions.parent",
				["l"] = "actions.select",
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				max_width = 100,
				max_height = 50,
			},
		})
	end,
}
