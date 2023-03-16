-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- map leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
lazy.setup({
	-- Utility
	"nvim-lua/plenary.nvim", -- useful lua functions used by lots of plugins
	"nvim-lua/popup.nvim", -- vim popup api in neovim
	"numToStr/Comment.nvim", -- easily comment stuff
	"kyazdani42/nvim-web-devicons", -- file icons
	"kyazdani42/nvim-tree.lua", -- nvim-tree file explorer
	"akinsho/toggleterm.nvim", -- terminal integration
	"ahmedkhalf/project.nvim", -- project file search
	"lukas-reineke/indent-blankline.nvim", -- show tab and indents
	"antoinemadec/FixCursorHold.nvim", -- this is needed to fix lsp doc highlight
	"famiu/bufdelete.nvim", -- better buffer manipulation
	"karb94/neoscroll.nvim", -- smooth scroll
	"phaazon/hop.nvim", -- hop to any word you like
	"rcarriga/nvim-notify", -- vim notify
	"kevinhwang91/nvim-hlslens", -- search with count
	"norcalli/nvim-colorizer.lua", -- colorizer
	"nguyenvukhang/nvim-toggler", -- toggle texts
	"sitiom/nvim-numbertoggle", -- toggle between relative and absolute numbers
	"mizlan/iswap.nvim", -- swap nodes using treesitter

	-- Interface
	"folke/which-key.nvim", -- show available keys after hitting space
	"goolord/alpha-nvim", -- startup page
	"nvim-lualine/lualine.nvim", -- status line
	"akinsho/bufferline.nvim", -- buffer tab line
	"folke/todo-comments.nvim", -- todo comments highlighting

	-- Markdown
	"godlygeek/tabular", -- text filtering
	"preservim/vim-markdown", -- markdown mode
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	}, -- markdown-preview

	-- Colorschemes
	"sainnhe/gruvbox-material", -- gruvbox

	-- Completion
	{
		"hrsh7th/nvim-cmp", -- the completion plugin
		dependencies = {
			-- cmp sources
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-nvim-lsp", -- lsp completions
			"hrsh7th/cmp-nvim-lua", -- lua completions
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"lukas-reineke/cmp-under-comparator", -- sort completions
			{
				"tzachar/cmp-tabnine", -- tabnine completions
				build = "./install.sh"
			},
			"kdheepak/cmp-latex-symbols", -- latex symbols
			"kylechui/nvim-surround", -- surround character manipulation
			"windwp/nvim-autopairs", -- autopairs

			-- Snippets
			"L3MON4D3/LuaSnip", --snippet engine
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		}
	},


	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"ray-x/lsp_signature.nvim", -- for lsp signatures
	"utilyre/barbecue.nvim", -- winbar components
	{
		"williamboman/mason.nvim", -- external tool management
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- mason lspconfig bridging
		}
	},

	-- Telescope
	"nvim-telescope/telescope.nvim", -- highly extendable fuzzy finder over lists

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter", -- treesitter for syntax highlighting
		build = function()
			pcall(require("nvim-treesitter.install").update { with_sync = true })
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context", -- show treesitter context
			"JoosepAlviste/nvim-ts-context-commentstring", -- comment based on cursor location
			"simrat39/symbols-outline.nvim", -- symbol outlines
			"RRethy/vim-illuminate", -- automatically highlighting other uses of the current word under the cursor
			"SmiteshP/nvim-navic", -- status line components that shows current code context
		}
	},

	-- Git
	"lewis6991/gitsigns.nvim", -- git integration
	"f-person/git-blame.nvim", -- git blames

	-- Dap
	{
		"mfussenegger/nvim-dap", -- debugging
		dependencies = {
			"rcarriga/nvim-dap-ui", -- debugging ui
		}
	},

	-- Code runners
	"is0n/jaq-nvim", -- code runner
})
