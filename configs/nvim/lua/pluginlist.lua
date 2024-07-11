return {

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	--	config = function()
	--		vim.cmd("colorscheme tokyonight-night")
	--	end
	},
	{ 
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		opts = ...,
		config = function ()
			vim.cmd("colorscheme gruvbox")
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("lualine").setup({
				icons_enabled = true ,
				theme = "gruvbox-material"
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"folke/neodev.nvim"
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',

		},
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-treesitter/nvim-treesitter', 
		build = ':TSUpdate'
	},
}
