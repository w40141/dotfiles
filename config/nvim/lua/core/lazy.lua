local gl = require("core.global")
local v = gl.v
local fn = gl.fn
local opt = gl.opt

local confUi = require("modulesTmp.ui.config")
local setupUi = require("modulesTmp.ui.setup")
local confTree = require("modules.treesitter.config")
local confTool = require("modules.tool.config")
local setupTool = require("modules.tool.setup")
local confMisc = require("modules.misc.config")
local setupMisc = require("modules.misc.setup")
local confLsp = require("modules.lsp.config")
local setupLsp = require("modules.lsp.setup")
local confLang = require("modules.lang.config")
local confFzf = require("modules.fzf.config")
local setupFzf = require("modules.fzf.setup")
local setupEdit = require("modules.edit.setup")
local confEdit = require("modules.edit.config")
local confComplement = require("modules.complement.config")
-- local setup = require("modules.complement.setup")

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not v.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
		lazy = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
}

require("lazy").setup({
	{
		"rebelot/kanagawa.nvim",
		event = { "VimEnter" },
		config = confUi.kanagawa,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufWinEnter",
		config = confUi.alpha,
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "Aerial" },
		init = setupUi.aerial,
		config = confUi.aerial,
	},
	{
		-- Buffer line
		"akinsho/bufferline.nvim",
		event = { "BufReadPre" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = setupUi.bufferline,
		config = confUi.bufferline,
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"rebelot/kanagawa.nvim",
			"stevearc/aerial.nvim",
		},
		init = setupUi.lualine,
		config = confUi.lualine,
	},
	{
		-- Indent guide
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost" },
		config = confUi.indent_blankline,
	},
	-- {
	--   -- A fancy, configurable, notification manager for NeoVim
	--   "folke/noice.nvim",
	--   event = {
	--     "BufRead",
	--     "BufNewFile",
	--     "InsertEnter",
	--     "CmdlineEnter",
	--     "CursorHold",
	--     "FocusLost",
	--   },
	--   module = { "noice" },
	--   dependencies = {
	--     { "MunifTanjim/nui.nvim" },
	--     {
	--       "rcarriga/nvim-notify",
	--       module = { "notify" },
	--       config = conf.notify,
	--     },
	--   },
	--   setup = setup.noice,
	--   config = conf.noice,
	-- },
	{
		-- Scrollbar
		"petertriho/nvim-scrollbar",
		event = {
			"BufRead",
			"BufNewFile",
			"InsertEnter",
			"CmdlineEnter",
			"CursorHold",
			"FocusLost",
		},
		config = confUi.scrollbar,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost" },
		config = confUi.gitsigns,
	},
	{
		-- File finder
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setupUi.nvimTree,
		config = confUi.nvimTree,
	},
	{
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = confTree.treesitter,
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	{
		"yioneko/nvim-yati",
		event = { "BufNewFile", "BufRead" },
	},
	{
		"m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
	},
	-- e({"mrjones2014/nvim-ts-rainbow"}),
	-- e({ "p00f/nvim-ts-rainbow" }),
	{
		"haringsrob/nvim_context_vt",
		config = confTree.context_vt,
		event = { "BufNewFile", "BufRead" },
	},
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Neogit" },
		config = confTool.neogit,
	},
	{
		-- Delete buffers
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
		event = "CmdlineEnter",
	},
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<c-;>", mode = "n" },
		},
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = confTool.toggleterm,
	},
	{
		-- Resizing of windows
		"simeji/winresizer",
		keys = {
			{ "<C-e>", mode = "n" },
		},
		init = setupTool.winresizer,
	},
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		keys = {
			{ "<Plug>(quickhl-manual-this)", mode = "n" },
			{ "<Plug>(quickhl-manual-reset)", mode = "n" },
		},
		init = setupTool.quickhl,
	},
	{
		-- Highlight length of search result
		"kevinhwang91/nvim-hlslens",
		keys = {
			{ "*", mode = "n" },
			{ "g*", mode = "n" },
			{ "g*", mode = "n" },
		},
		event = { "CmdlineEnter" },
		dependencies = { "rapan931/lasterisk.nvim" },
		init = setupTool.hlslens,
		config = confTool.hlslens,
	},
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		"vim-test/vim-test",
		event = "CmdlineEnter",
		init = setupMisc.vim_test,
		config = confMisc.vim_test,
	},
	{
		-- Generating images of source code using
		"segeljakt/vim-silicon",
		cmd = "Silicon",
	},
	{
		-- Open URI
		"tyru/open-browser.vim",
		keys = {
			{ "<plug>(openbrowser-smart-search)", mode = "n" },
		},
		init = setupMisc.open_browser,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			{
				"williamboman/mason.nvim",
				config = confLsp.mason,
			},
		},
		init = setupLsp.lspconfig,
		config = confLsp.lspconfig,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
		config = confLsp.mason_tool_installer,
	},
	{
		-- Automatically uppercase SQL keywords
		"jsborjesson/vim-uppercase-sql",
		ft = "sql",
	},
	{
		"previm/previm",
		ft = "markdown",
		config = confLang.previm,
	},
	{
		-- TODO: https://github.com/kevinhwang91/nvim-bqf
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = confLang.rust,
	},
	{
		-- Fzf finder
		"nvim-telescope/telescope.nvim",
		cmd = {
			"Telescope",
		},
		dependencies = {
			{
				"folke/trouble.nvim",
				cmd = { "Trouble" },
				dependencies = { "nvim-tree/nvim-web-devicons" },
				init = setupFzf.trouble,
				config = confFzf.trouble,
			},
			{ "stevearc/aerial.nvim" },
		},
		init = setupFzf.telescope,
		config = confFzf.telescope,
	},
	{
		-- Highlight, list and search todo comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
		init = setupFzf.todo_comments,
		config = confFzf.todo_comments,
	},
	{
		-- Annotation generator
		"danymat/neogen",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		setup = setupEdit.neogen,
		config = confEdit.neogen,
	},
	{
		-- A surround text object plugin for neovim written in lua.
		"ur4ltz/surround.nvim",
		config = confEdit.surround,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		-- engine SKK
		"tyru/eskk.vim",
		init = setupEdit.eskk,
		config = confEdit.eskk,
		event = { "InsertEnter" },
	},
	{
		-- Comment out
		"numToStr/Comment.nvim",
		config = confEdit.comment,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		-- Colorizer
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = confEdit.colorizer,
	},
	{
		-- Use Neovim as a language server to inject LSP diagnostics, code actions
		"jose-elias-alvarez/null-ls.nvim",
		event = { "FocusLost", "CursorHold" },
		dependencies = "nvim-lua/plenary.nvim",
		config = confEdit.null_ls,
	},
	{
		"gbprod/yanky.nvim",
		dependencies = { "stevearc/dressing.nvim", opt = true },
		keys = {
			{ "<Plug>(YankyCycleBackward)", mode = "n" },
			{ "<Plug>(YankyCycleForward)", mode = "n" },
			{ "<Plug>(YankyGPutAfter)", mode = "n" },
			{ "<Plug>(YankyGPutBefore)", mode = "n" },
			{ "<Plug>(YankyPutAfter)", mode = "n" },
			{ "<Plug>(YankyPutBefore)", mode = "n" },
			{ "<Plug>(YankyGPutAfter)", mode = "x" },
			{ "<Plug>(YankyGPutBefore)", mode = "x" },
			{ "<Plug>(YankyPutAfter)", mode = "x" },
			{ "<Plug>(YankyPutBefore)", mode = "x" },
		},
		cmd = { "YankyRingHistory" },
		init = setupEdit.yanky,
		config = confEdit.yanky,
	},
	{
		"hrsh7th/nvim-cmp",
		config = confComplement.cmp,
		event = { "InsertEnter" },
		dependencies = {
			{ "onsails/lspkind-nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"ray-x/lsp_signature.nvim",
				event = "VeryLazy",
				config = confComplement.lsp_signature,
			},
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{ "hrsh7th/cmp-buffer" },
			{ "ray-x/cmp-treesitter" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					"L3MON4D3/LuaSnip",
					dependencies = { "rafamadriz/friendly-snippets" },
					config = confComplement.luasnip,
				},
			},
			{
				"zbirenbaum/copilot.lua",
				build = "Copilot",
				config = confComplement.copilot,
			},
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = confComplement.autopairs,
	},
}, opts)
