-- animate neovim animations

local M = {
	"echasnovski/mini.nvim",
	version = false,
}

function M.config()
	require("mini.animate").setup()
	-- require("mini.surround").setup()
end

return M
