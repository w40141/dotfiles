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

local function i(p)
	p.event = { "InsertEnter" }
	return p
end

local function c(p)
	p.event = { "CmdlineEnter" }
	return p
end

local function t(p)
	p.event = { "BufRead", "BufNewFile" }
	return p
end

local function e(p)
	p.event = { "BufReadPre", "FocusLost", "CursorHold" }
	return p
end

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

require("lazy").setup({
	{
		"rebelot/kanagawa.nvim",
		event = { "VimEnter" },
		config = confUi.kanagawa,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
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
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		init = setupUi.bufferline,
		config = confUi.bufferline,
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre" },
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "rebelot/kanagawa.nvim" },
			{ "stevearc/aerial.nvim" },
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
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setupUi.nvimTree,
		config = confUi.nvimTree,
	},
	{
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = { "BufNewFile", "BufRead" },
		config = confTree.treesitter,
	},
	t({ "nvim-treesitter/nvim-treesitter-textobjects" }),
	t({ "yioneko/nvim-yati" }),
	t({ "m-demare/hlargs.nvim" }),
	-- e({"mrjones2014/nvim-ts-rainbow"}),
	-- e({ "p00f/nvim-ts-rainbow" }),
	t({
		"haringsrob/nvim_context_vt",
		config = confTree.context_vt,
	}),
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim", opt = true },
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
		keys = { "n", [[<c-;>]] },
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = confTool.toggleterm,
	},
	{
		-- Resizing of windows
		"simeji/winresizer",
		keys = { { "n", "<C-e>" } },
		init = setupTool.winresizer,
	},
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		keys = {
			{ "n", "<Plug>(quickhl-manual-this)" },
			{ "n", "<Plug>(quickhl-manual-reset)" },
		},
		init = setupTool.quickhl,
	},
	{
		-- Highlight length of search result
		"kevinhwang91/nvim-hlslens",
		keys = { { "n", "*" }, { "n", "g*" }, { "n", "g*" } },
		event = { "CmdlineEnter" },
		dependencies = {
			"rapan931/lasterisk.nvim",
		},
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
		keys = { "<plug>(openbrowser-smart-search)" },
		init = setupMisc.open_browser,
	},
	e({
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
			},
			{
				"williamboman/mason.nvim",
				config = confLsp.mason,
			},
		},
		init = setupLsp.lspconfig,
		config = confLsp.lspconfig,
	}),
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
		config = confLsp.mason_tool_installer,
	},
	{
		-- Automatically uppercase SQL keywords
		"jsborjesson/vim-uppercase-sql",
		ft = { "sql" },
	},
	{
		"previm/previm",
		ft = { "markdown" },
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
		cmd = { "Telescope" },
		dependencies = {
			{
				"folke/trouble.nvim",
				cmd = { "Trouble" },
				module = { "trouble" },
				dependencies = {
					{ "nvim-tree/nvim-web-devicons" },
				},
				init = setupFzf.trouble,
				config = confFzf.trouble,
			},
			{ "stevearc/aerial.nvim", module = { "aerial" } },
		},
		init = setupFzf.telescope,
		config = confFzf.telescope,
	},
	{
		-- Highlight, list and search todo comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		cmd = {
			"TodoQuickFix",
			"TodoLocList",
			"TodoTrouble",
			"TodoTelescope",
		},
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
	e({
		-- A surround text object plugin for neovim written in lua.
		"ur4ltz/surround.nvim",
		config = confEdit.surround,
	}),
	i({
		-- engine SKK
		"tyru/eskk.vim",
		keys = {
			{ "i", "<Plug>(eskk:toggle)" },
			{ "c", "<Plug>(eskk:toggle)" },
		},
		init = setupEdit.eskk,
		config = confEdit.eskk,
	}),
	e({
		-- Comment out
		"numToStr/Comment.nvim",
		config = confEdit.comment,
	}),
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
			{ "n", "<Plug>(YankyCycleBackward)" },
			{ "n", "<Plug>(YankyCycleForward)" },
			{ "n", "<Plug>(YankyGPutAfter)" },
			{ "n", "<Plug>(YankyGPutBefore)" },
			{ "n", "<Plug>(YankyPutAfter)" },
			{ "n", "<Plug>(YankyPutBefore)" },
			{ "x", "<Plug>(YankyGPutAfter)" },
			{ "x", "<Plug>(YankyGPutBefore)" },
			{ "x", "<Plug>(YankyPutAfter)" },
			{ "x", "<Plug>(YankyPutBefore)" },
		},
		cmd = { "YankyRingHistory" },
		init = setupEdit.yanky,
		config = confEdit.yanky,
	},
	{
		"hrsh7th/nvim-cmp",
		config = confComplement.cmp,
		dependencies = {
			{ "onsails/lspkind-nvim" },
			i({ "hrsh7th/cmp-nvim-lsp" }),
			i({ "ray-x/lsp_signature.nvim", config = confComplement.signature }),
			i({ "hrsh7th/cmp-nvim-lsp-document-symbol" }),
			i({ "hrsh7th/cmp-buffer" }),
			i({ "ray-x/cmp-treesitter" }),
			c({ "hrsh7th/cmp-cmdline" }),
			c({ "hrsh7th/cmp-path" }),
			i({
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					"L3MON4D3/LuaSnip",
					dependencies = { "rafamadriz/friendly-snippets" },
					config = confComplement.luasnip,
				},
			}),
			i({
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			}),
		},
	},
	i({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = confComplement.copilot,
	}),
	{
		"windwp/nvim-autopairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = confComplement.autopairs,
	},
})
