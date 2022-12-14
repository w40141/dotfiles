-- TODO: https://zenn.dev/kawarimidoll/articles/2e99432d27eda3
-- TODO: https://dev.classmethod.jp/articles/eetann-noice-nvim-beginner/
-- TODO: https://qiita.com/delphinus/items/fb905e452b2de72f1a0f

-- TODO: https://github.com/folke/noice.nvim
-- TODO: https://github.com/rcarriga/nvim-notify
-- TODO: https://github.com/jose-elias-alvarez/null-ls.nvim
-- TODO: https://github.com/kevinhwang91/nvim-bqf
-- TODO: https://github.com/ray-x/lsp_signature.nvim

local v = vim

local ensure_packer = function()
	local install_path = v.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if v.fn.empty(v.fn.glob(install_path)) > 0 then
		v.fn.system({
			"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
			install_path
		})
		v.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
	-- Package Manager
	-- https://github.com/wbthomason/packer.nvim
	use({ "wbthomason/packer.nvim" })

	-- Colorscheme
	use({
		-- https://github.com/rebelot/kanagawa.nvim
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	})

	-- Greeter
	use({
		-- https://github.com/goolord/alpha-nvim
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		wants = { "nvim-web-devicons" },
		config = function()
			require("rc.alpha-nvim")
		end,
	})

	-- Fzf finder
	use {
		-- https://github.com/nvim-telescope/telescope.nvim
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		module = { "telescope" },
		requires = {
			{
				-- https://github.com/folke/trouble.nvim
				"folke/trouble.nvim",
				module = { "trouble" },
				requires = {
					{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
				},
				wants = { "nvim-web-devicons" },
				config = function()
					require("rc.trouble-nvim")
				end,
			},
			{ "stevearc/aerial.nvim" },
		},
		wants = { "trouble.nvim", "aerial.nvim" },
		-- setup = function()
		-- 	local function builtin(name)
		-- 		return function()
		-- 			return require("telescope.builtin")[name]()
		-- 		end
		-- 	end
		--
		-- 	vim.keymap.set("n", "[ff]p", builtin "find_files")
		-- 	vim.keymap.set("n", "[ff]f", builtin "git_files")
		-- 	vim.keymap.set("n", "[ff]g", builtin "live_grep")
		-- 	vim.keymap.set("n", "[ff]/", builtin "grep_string")
		-- 	vim.keymap.set("n", "[ff]b", builtin "buffers")
		-- 	vim.keymap.set("n", "[ff]l", builtin "current_buffer_fuzzy_find")
		-- 	vim.keymap.set("n", "[ff]gs", builtin "git_status")
		-- 	vim.keymap.set("n", "[ff]gc", builtin "git_commits")
		-- 	vim.keymap.set("n", "[ff]gC", builtin "git_bcommits")
		-- 	vim.keymap.set("n", "[ff]gb", builtin "git_branches")
		-- 	vim.keymap.set("n", "[ff]q", builtin "diagnostics")
		-- 	vim.keymap.set("n", "[ff]r", builtin "lsp_references")
		-- 	vim.keymap.set("n", "[ff]d", builtin "lsp_definitions")
		-- end,
		setup = require("rc.setup.telescope-nvim"),
		config = function()
			require("rc.telescope-nvim")
		end
	}

	-- Treesitter configurations
	use({
		-- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile", "InsertEnter" },
		run = ":TSUpdate",
		config = function()
			require("rc.nvim-treesitter")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" }
	})
	use({
		"yioneko/nvim-yati",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" }
	})
	use({
		"m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" }
	})
	use({
		"p00f/nvim-ts-rainbow",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" }
	})
	use({
		"haringsrob/nvim_context_vt",
		event = { "BufNewFile", "BufRead", "FocusLost", "CursorHold" },
		wants = { "nvim-treesitter" }
	})

	-- TODO:
	-- Annotation generator
	use({
		-- https://github.com/danymat/neogen
		"danymat/neogen",
		requires = { "nvim-treesitter/nvim-treesitter" },
		wants = { "nvim-treesitter" },
		config = function()
			require("rc/neogen")
		end,
	})

	use({
		-- https://github.com/stevearc/aerial.nvim
		"stevearc/aerial.nvim",
		config = function()
			require("rc.aerial-nvim")
		end,
	})

	-- Buffer line
	use({
		-- https://github.com/akinsho/bufferline.nvim
		"akinsho/bufferline.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
		},
		wants = { "nvim-web-devicons" },
		config = function()
			require("rc.bufferline-nvim")
		end,
	})

	-- Status line
	use({
		-- https://github.com/nvim-lualine/lualine.nvim
		"nvim-lualine/lualine.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
			{ "rebelot/kanagawa.nvim" },
			{ "stevearc/aerial.nvim" },
		},
		wants = { "nvim-web-devicons", "kanagawa.nvim", "aerial.nvim" },
		config = function()
			require("rc.lualine-nvim")
		end,
	})

	-- Indent guide
	use({
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		config = function()
			require("rc.indent-blankline-nvim")
		end,
	})

	-- quickly highlight <cword> or visually selected word
	use({
		-- https://github.com/t9md/vim-quickhl
		"t9md/vim-quickhl",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		config = function()
			require("rc.vim-quickhl")
		end,
	})

	-- Highlight, list and search todo comments
	use({
		-- https://github.com/folke/todo-comments.nvim
		"folke/todo-comments.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		requires = { "nvim-lua/plenary.nvim" },
		wants = { "plenary.nvim" },
		config = function()
			require("rc.todo-comments-nvim")
		end,
	})

	-- A surround text object plugin for neovim written in lua.
	use({
		-- https://github.com/ur4ltz/surround.nvim
		"ur4ltz/surround.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		config = function()
			require("rc.surround-nvim")
		end,
	})

	-- LSP
	use({
		-- https://github.com/neovim/nvim-lspconfig
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre" },
		requires = {
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				event = { "FocusLost", "CursorHold" },
				config = function()
					require("rc.mason-tool-installer")
				end,
			},
			{
				"neovim/nvim-lspconfig",
				module = { "lspconfig" },
				config = function()
					require("rc.nvim-lspconfig")
				end,
			},
			{
				"williamboman/mason.nvim",
				module = { "mason" },
				config = function()
					require("rc.mason")
				end,
			},
		},
		wants = {
			"mason.nvim",
			"nvim-lspconfig",
			"cmp-nvim-lsp",
		},
		config = function()
			require("rc.mason-lspconfig")
		end
	})

	use({
		-- https://github.com/hrsh7th/nvim-cmp
		"hrsh7th/nvim-cmp",
		module = { "cmp" },
		config = function()
			require("rc.nvim-cmp")
		end,
		requires = {
			-- https://github.com/onsails/lspkind.nvim
			{ "onsails/lspkind-nvim", module = { "lspkind" } },
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp
				"hrsh7th/cmp-nvim-lsp",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
				"hrsh7th/cmp-nvim-lsp-signature-help",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-buffer
				"hrsh7th/cmp-buffer",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/ray-x/cmp-treesitter
				"ray-x/cmp-treesitter",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/yutkat/cmp-mocword
				"yutkat/cmp-mocword",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/f3fora/cmp-spell
				"f3fora/cmp-spell",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-cmdline
				"hrsh7th/cmp-cmdline",
				event = { "CmdlineEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-path
				"hrsh7th/cmp-path",
				event = { "CmdlineEnter" },

			},
			{
				-- https://github.com/saadparwaiz1/cmp_luasnip
				"saadparwaiz1/cmp_luasnip",
				event = { "InsertEnter" },
				requires = {
					{
						-- https://github.com/L3MON4D3/LuaSnip
						"L3MON4D3/LuaSnip",
						module = { "luasnip" },
						requires = {
							-- https://github.com/rafamadriz/friendly-snippets
							-- { "rafamadriz/friendly-snippets" },
							-- https://github.com/honza/vim-snippets
							{"honza/vim-snippets"}
						},
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				}
			},
		},
	})

	use({
		-- https://github.com/windwp/nvim-autopairs
		"windwp/nvim-autopairs",
		module = { "nvim-autopairs" },
		want = { "nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup()
		end
	})

	-- TODO:
	-- engine SKK
	use({
		-- https://github.com/tyru/eskk.vim
		"tyru/eskk.vim",
		event = "InsertEnter",
		config = function()
			require("rc.eskk-vim")
		end,
	})

	-- TODO:
	-- A fancy, configurable, notification manager for NeoVim
	-- https://github.com/rcarriga/nvim-notify
	-- use {
	-- 	"folke/noice.nvim",
	-- 	event = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" },
	-- 	module = { "noice" },
	-- 	requires = {
	-- 		{ "MunifTanjim/nui.nvim" },
	use({
		"rcarriga/nvim-notify",
		module = { "notify" },
		config = function()
			require("notify").setup {
				stages = "slide",
				background_colour = "FloatShadow",
				timeout = 3000,
			}
			vim.notify = require("notify")
		end
	})
	-- 	},
	-- 	wants = { "nvim-treesitter" },
	-- 	setup = function()
	-- 		if not _G.__vim_notify_overwritten then
	-- 			vim.notify = function(...)
	-- 				local arg = { ... }
	-- 				require "notify"
	-- 				require "noice"
	-- 				vim.schedule(function()
	-- 					vim.notify(unpack(args))
	-- 				end)
	-- 			end
	-- 			_G.__vim_notify_overwritten = true
	-- 		end
	-- 	end,
	-- 	config = function()
	-- 		require("noice").setup {
	-- 			-- noice.nvim の設定
	-- 		}
	-- 	end
	-- }

	-- TODO:
	-- Use Neovim as a language server to inject LSP diagnostics, code actions
	use({
		-- https://github.com/jose-elias-alvarez/null-ls.nvim
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		config = function()
			require("rc.null-ls-nvim")
		end,
	})

	use({
		"vim-jp/vimdoc-ja",
		cmd = "help",
	})

	-- TODO:
	use({
		"airblade/vim-rooter",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		config = function()
			require("rc.vim-rooter")
		end,
	})

	use({
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	})

	use({
		"vim-test/vim-test",
		event = "CmdlineEnter",
		config = function()
			require("rc.vim-test")
		end,
	})

	-- Generating images of source code using
	use({
		-- https://github.com/segeljakt/vim-silicon
		"segeljakt/vim-silicon",
		cmd = "Silicon",
	})

	-- Automatically uppercase SQL keywords
	use({
		-- https://github.com/jsborjesson/vim-uppercase-sql
		"jsborjesson/vim-uppercase-sql",
		ft = { "sql" },
	})

	-- Delete buffers
	use({
		-- https://github.com/famiu/bufdelete.nvim
		"famiu/bufdelete.nvim",
		event = "CmdlineEnter",
	})

	-- File finder
	use({
		-- https://github.com/tamago324/lir.nvim
		"tamago324/lir.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
			{ "nvim-lua/plenary.nvim" }
		},
		wants = { "plenary.nvim", "nvim-web-devicons" },
		config = function()
			require("rc.lir-nvim")
		end,
	})

	-- Open URI
	use({
		-- https://github.com/tyru/open-browser.vim
		"tyru/open-browser.vim",
		keys = { "<plug>(openbrowser-smart-search)" },
		setup = function()
			-- vim.g.netrw_nogx = 1
			vim.keymap.set("n", "gx", "<plug>(openbrowser-smart-search)")
			vim.keymap.set("v", "gx", "<plug>(openbrowser-smart-search)")
		end,
		config = function()
			require("rc.open-browser-vim")
		end,
	})

	use({
		"previm/previm",
		ft = { "markdown" },
		config = function()
			require("rc.previm")
		end,
	})

	-- use({
	-- 	"simrat39/rust-tools.nvim",
	-- 	module = { "rust-tools" },
	-- 	config = function()
	-- 		-- require("rc.rust-tools-nvim")
	-- 		require('rust-tools').setup()
	-- 	end
	-- })

	-- Resizing of windows
	use({
		-- https://github.com/simeji/winresizer
		"simeji/winresizer",
		keys = { { "n", "<C-e>" } },
		config = function()
			require("rc.winresizer")
		end,
	})

	-- Comment out
	use({
		-- https://github.com/numToStr/Comment.nvim
		"numToStr/Comment.nvim",
		event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
		config = function()
			require("Comment").setup()
		end,
	})

	-- Terminal
	use({
		-- https://github.com/akinsho/toggleterm.nvim
		"akinsho/toggleterm.nvim",
		keys = { "n", [[<c-;>]] },
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = function()
			require("rc.toggleterm-nvim")
		end,
	})

	-- TODO:
	use({
		-- https://github.com/TimUntersberger/neogit
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		wants = "plenary.nvim",
		cmd = { "Neogit" },
		config = function()
			require("neogit").setup({})
		end,
	})

	-- Scrollbar
	use {
		-- https://github.com/petertriho/nvim-scrollbar
		"petertriho/nvim-scrollbar",
		event = {
			"BufWinEnter",
			"CmdwinLeave",
			"TabEnter",
			"TermEnter",
			"TextChanged",
			"VimResized",
			"WinEnter",
			"WinScrolled",
		},
		config = function()
			require("scrollbar").setup {}
		end,
	}

	use({
		-- https://github.com/lewis6991/gitsigns.nvim
		"lewis6991/gitsigns.nvim",
		event = { "FocusLost", "CursorHold" },
		config = function()
			require("rc.gitsigns-nvim")
		end,
	})

	-- Colorizer
	use({
		-- https://github.com/norcalli/nvim-colorizer.lua
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup({})
		end,
	})

	-- Highlight length of search result
	use({
		-- https://github.com/kevinhwang91/nvim-hlslens
		"kevinhwang91/nvim-hlslens",
		keys = { { 'n', '*' }, { 'n', 'g*' }, { 'n', 'g*' } },
		event = { "CmdlineEnter" },
		-- https://github.com/rapan931/lasterisk.nvim
		requires = { "rapan931/lasterisk.nvim", opt = true },
		wants = { "lasterisk.nvim" },
		config = function()
			require("rc.nvim-hlslens")
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
