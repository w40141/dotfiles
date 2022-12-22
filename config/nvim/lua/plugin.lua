-- TODO: https://github.com/kevinhwang91/nvim-bqf

-- TODO: https://github.com/lewis6991/impatient.nvim
-- TODO: https://blog.atusy.net/2022/12/16/impatient-nvim/

-- TODO: https://github.com/phaazon/hop.nvim

-- TODO: https://github.com/dvdsk/prosesitter.nvim

local v = vim
local fn = v.fn
local uv = v.loop
local command = v.api.nvim_create_user_command

local Pack = {}

Pack.new = function()
	local self = setmetatable({
		initialized = false,
		_packer = nil,
	}, { __index = Pack })
	self:assume_plugins()
	self:setup()
	return self
end

function Pack:setup()
	command("PackerInstall", self:run_packer "install", { desc = "[Packer] Install plugins" })
	command("PackerUpdate", self:run_packer "update", { desc = "[Packer] Update plugins" })
	command("PackerClean", self:run_packer "clean", { desc = "[Packer] Clean plugins" })
	command("PackerStatus", self:run_packer "status", { desc = "[Packer] Output plugins status" })
	command("PackerSync", self:run_packer "sync", { desc = "[Packer] Output plugins status" })
	command("PackerLoad", function(opts)
		local args = v.split(opts.args, " ")
		table.insert(args, opts.bang)
		self:run_packer "loader" (table.unpack(opts))
	end, { bang = true, complete = self:run_packer "loader_complete", desc = "[Packer] Load plugins", nargs = "+" })
end

function Pack:assume_plugins()
	local data_dir = fn.stdpath "data"
	for _, p in ipairs {
		{ "wbthomason/packer.nvim", opt = true },
	} do
		local dir = p.opt and "opt" or "start"
		local pkg = p[1]
		local branch = p.branch or "master"
		local name = pkg:match "[^/]+$"
		local path = ("%s/site/pack/packer/%s/%s"):format(data_dir, dir, name)
		if not self:exists(path) then
			v.cmd(("!git clone https://github.com/%s %s -b %s"):format(pkg, path, branch))
		end
	end
end

function Pack:exists(path) -- luacheck: ignore 212
	local st = uv.fs_stat(path)
	return st and true or false
end

function Pack:run_packer(method)
	return function(opts)
		self:packer()[method](opts)
	end
end

function Pack:packer()
	if not self._packer then
		v.cmd.packadd [[packer.nvim]]
		local packer = require "packer"
		packer.init {
			compile_path = self.compile_path,
			compile_on_sync = true,
			profile = { enable = false, threshold = 1 },
			disable_commands = true,
			max_jobs = 50,
		}
		packer.reset()
		packer.use {
			{ "wbthomason/packer.nvim", opt = true },
			{
				-- https://github.com/rebelot/kanagawa.nvim
				"rebelot/kanagawa.nvim",
				config = require("rc.config.kanagawa"),
			},
			-- Greeter
			{
				-- https://github.com/goolord/alpha-nvim
				"goolord/alpha-nvim",
				requires = { "kyazdani42/nvim-web-devicons", opt = true },
				wants = { "nvim-web-devicons" },
				event = "BufWinEnter",
				config = require("rc.config.alpha-nvim"),
			},
			-- Fzf finder
			{
				-- https://github.com/nvim-telescope/telescope.nvim
				"nvim-telescope/telescope.nvim",
				cmd = { "Telescope" },
				module = { "telescope" },
				requires = {
					{
						-- https://github.com/folke/trouble.nvim
						"folke/trouble.nvim",
						cmd = { "Trouble" },
						module = { "trouble" },
						requires = {
							{
								"kyazdani42/nvim-web-devicons",
								module = { "nvim-web-devicons" },
							},
						},
						wants = { "nvim-web-devicons" },
						setup = require("rc.setup.trouble-nvim"),
						config = require("rc.config.trouble-nvim"),
					},
					{ "stevearc/aerial.nvim", module = { "aerial" } },
				},
				wants = { "trouble.nvim", "aerial.nvim" },
				setup = require("rc.setup.telescope-nvim"),
				config = require("rc.config.telescope-nvim"),
			},
			-- Treesitter configurations
			{
				-- https://github.com/nvim-treesitter/nvim-treesitter
				"nvim-treesitter/nvim-treesitter",
				event = { "BufRead", "BufNewFile", "InsertEnter" },
				run = ":TSUpdate",
				config = require("rc.config.nvim-treesitter"),
			},
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				event = { "BufNewFile", "BufRead" },
				wants = { "nvim-treesitter" },
			},
			{
				"yioneko/nvim-yati",
				event = { "BufNewFile", "BufRead" },
				wants = { "nvim-treesitter" },
			},
			{
				"m-demare/hlargs.nvim",
				event = { "BufNewFile", "BufRead" },
				wants = { "nvim-treesitter" },
			},
			{
				"p00f/nvim-ts-rainbow",
				event = { "BufNewFile", "BufRead" },
				wants = { "nvim-treesitter" },
			},
			{
				"haringsrob/nvim_context_vt",
				event = { "BufNewFile", "BufRead", "FocusLost", "CursorHold" },
				wants = { "nvim-treesitter" },
			},
			-- Annotation generator
			{
				-- https://github.com/danymat/neogen
				"danymat/neogen",
				requires = { "nvim-treesitter/nvim-treesitter" },
				module = { "neogen" },
				wants = { "nvim-treesitter" },
				setup = require("rc.setup.neogen"),
				config = require("rc.config.neogen"),
			},
			{
				-- https://github.com/stevearc/aerial.nvim
				"stevearc/aerial.nvim",
				module = { "aerial" },
				cmd = { "Aerial" },
				setup = require("rc.setup.aerial-nvim"),
				config = require("rc.config.aerial-nvim"),
			},
			-- Buffer line
			{
				-- https://github.com/akinsho/bufferline.nvim
				"akinsho/bufferline.nvim",
				event = {
					"BufReadPost",
				},
				requires = {
					{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
				},
				wants = { "nvim-web-devicons" },
				setup = require("rc.setup.bufferline-nvim"),
				config = require("rc.config.bufferline-nvim"),
			},
			-- Status line
			{
				-- https://github.com/nvim-lualine/lualine.nvim
				"nvim-lualine/lualine.nvim",
				event = {
					"BufReadPre",
				},
				requires = {
					{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
					{ "rebelot/kanagawa.nvim" },
					{ "stevearc/aerial.nvim", module = { "aerial" } },
				},
				wants = { "nvim-web-devicons", "kanagawa.nvim", "aerial.nvim" },
				setup = function()
					require("rc.setup.lualine")
				end,
				config = require("rc.config.lualine-nvim"),
			},
			-- Indent guide
			{
				-- https://github.com/lukas-reineke/indent-blankline.nvim
				"lukas-reineke/indent-blankline.nvim",
				event = {
					"BufReadPost"
				},
				config = require("rc.config.indent-blankline-nvim"),
			},
			-- quickly highlight <cword> or visually selected word
			{
				-- https://github.com/t9md/vim-quickhl
				"t9md/vim-quickhl",
				keys = {
					{ "n", "<Plug>(quickhl-manual-this)" },
					{ "n", "<Plug>(quickhl-manual-reset)" },
				},
				setup = require("rc.setup.vim-quickhl"),
			},
			-- Highlight, list and search todo comments
			{
				-- https://github.com/folke/todo-comments.nvim
				"folke/todo-comments.nvim",
				event = {
					"InsertEnter",
					"CursorHold",
					"FocusLost",
					"BufRead",
					"BufNewFile",
				},
				requires = { "nvim-lua/plenary.nvim" },
				wants = { "plenary.nvim" },
				setup = require("rc.setup.todo-comments-nvim"),
				config = require("rc.config.todo-comments-nvim"),
			},
			-- A surround text object plugin for neovim written in lua.
			{
				-- https://github.com/ur4ltz/surround.nvim
				"ur4ltz/surround.nvim",
				event = {
					"InsertEnter",
					"CursorHold",
					"FocusLost",
					"BufRead",
					"BufNewFile",
				},
				config = require("rc.config.surround-nvim"),
			},
			-- LSP
			{
				-- https://github.com/neovim/nvim-lspconfig
				"neovim/nvim-lspconfig",
				event = { "BufReadPre" },
				requires = {
					{
						-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
						"WhoIsSethDaniel/mason-tool-installer.nvim",
						event = { "FocusLost", "CursorHold" },
						config = require("rc.config.mason-tool-installer"),
					},
					{
						-- https://github.com/williamboman/mason-lspconfig.nvim
						"williamboman/mason-lspconfig.nvim",
						module = { "mason-lspconfig" },
						config = require("rc.config.mason-lspconfig"),
					},
					{
						-- https://github.com/williamboman/mason.nvim
						"williamboman/mason.nvim",
						module = { "mason" },
						config = require("rc.config.mason"),
					},
				},
				wants = {
					"mason.nvim",
					"nvim-lspconfig",
					"cmp-nvim-lsp",
				},
				setup = require("rc.setup.nvim-lspconfig"),
				config = require("rc.config.nvim-lspconfig"),
			},
			{
				-- https://github.com/simrat39/rust-tools.nvim
				"simrat39/rust-tools.nvim",
				-- module = { "rust-tools" },
				ft = { "rust" },
				config = function()
					local rt = require("rust-tools")
					rt.setup({
						server = {
							on_attach = function(_, bufnr)
								-- Hover actions
								vim.keymap.set("n", "H", rt.hover_actions.hover_actions, { buffer = bufnr })
								-- Code action groups
								vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
							end,
						},
					})
				end
			},
			{
				-- https://github.com/hrsh7th/nvim-cmp
				"hrsh7th/nvim-cmp",
				module = { "cmp" },
				config = require("rc.config.nvim-cmp"),
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
							-- https://github.com/L3MON4D3/LuaSnip
							"L3MON4D3/LuaSnip",
							module = { "luasnip" },
							requires = { "honza/vim-snippets" },
							config = function()
								require("luasnip.loaders.from_vscode").lazy_load()
							end,
						},
					},
				},
			},
			{
				-- https://github.com/windwp/nvim-autopairs
				"windwp/nvim-autopairs",
				module = { "nvim-autopairs" },
				requires = { "hrsh7th/nvim-cmp" },
				want = { "nvim-cmp" },
				config = function()
					require("nvim-autopairs").setup()
				end,
			},
			-- engine SKK
			{
				-- https://github.com/tyru/eskk.vim
				"tyru/eskk.vim",
				keys = {
					{ "i", "<Plug>(eskk:toggle)" },
					{ "c", "<Plug>(eskk:toggle)" },
				},
				setup = require("rc.setup.eskk"),
				config = require("rc.config.eskk"),
			},
			-- A fancy, configurable, notification manager for NeoVim
			{
				-- https://github.com/folke/noice.nvim
				"folke/noice.nvim",
				event = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter", "CursorHold", "FocusLost" },
				module = { "noice" },
				requires = {
					{ "MunifTanjim/nui.nvim" },
					{
						-- https://github.com/rcarriga/nvim-notify
						"rcarriga/nvim-notify",
						module = { "notify" },
						config = require("rc.config.nvim-notify"),
					},
				},
				wants = { "nvim-treesitter" },
				setup = require("rc.setup.noice-nvim"),
				config = require("rc.config.noice-nvim"),
			},
			-- Use Neovim as a language server to inject LSP diagnostics, code actions
			{
				-- https://github.com/jose-elias-alvarez/null-ls.nvim
				"jose-elias-alvarez/null-ls.nvim",
				requires = "nvim-lua/plenary.nvim",
				event = {
					"CursorHold",
					"FocusLost",
				},
				config = require("rc.config.null-ls-nvim"),
			},
			{
				-- https://github.com/TimUntersberger/neogit
				"TimUntersberger/neogit",
				requires = { "nvim-lua/plenary.nvim", opt = true },
				wants = "plenary.nvim",
				cmd = { "Neogit" },
				config = function()
					require("neogit").setup({})
				end,
			},
			{
				"vim-jp/vimdoc-ja",
				cmd = "help",
			},
			{
				"dstein64/vim-startuptime",
				cmd = "StartupTime",
			},
			{
				"vim-test/vim-test",
				event = "CmdlineEnter",
				setup = require("rc.setup.vim-test"),
				config = require("rc.config.vim-test"),
			},
			-- Generating images of source code using
			{
				-- https://github.com/segeljakt/vim-silicon
				"segeljakt/vim-silicon",
				cmd = "Silicon",
			},
			-- Automatically uppercase SQL keywords
			{
				-- https://github.com/jsborjesson/vim-uppercase-sql
				"jsborjesson/vim-uppercase-sql",
				ft = { "sql" },
			},
			-- Delete buffers
			{
				-- https://github.com/famiu/bufdelete.nvim
				"famiu/bufdelete.nvim",
				event = "CmdlineEnter",
			},
			-- File finder
			{
				-- https://github.com/tamago324/lir.nvim
				"tamago324/lir.nvim",
				-- },
				module = { "lir.float" },
				requires = {
					{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
					{ "nvim-lua/plenary.nvim" },
				},
				wants = { "plenary.nvim", "nvim-web-devicons" },
				setup = require("rc.setup.lir-nvim"),
				config = require("rc.config.lir-nvim"),
			},
			-- Open URI
			{
				-- https://github.com/tyru/open-browser.vim
				"tyru/open-browser.vim",
				keys = { "<plug>(openbrowser-smart-search)" },
				setup = require("rc.setup.open-browser"),
			},
			{
				"previm/previm",
				ft = { "markdown" },
				config = require("rc.config.previm"),
			},
			-- Resizing of windows
			{
				-- https://github.com/simeji/winresizer
				"simeji/winresizer",
				keys = { { "n", "<C-e>" } },
				setup = require("rc.config.winresizer"),
			},
			-- Comment out
			{
				-- https://github.com/numToStr/Comment.nvim
				"numToStr/Comment.nvim",
				event = {
					"InsertEnter",
					"CursorHold",
					"FocusLost",
					"BufRead",
					"BufNewFile",
				},
				config = function()
					require("Comment").setup()
				end,
			},
			-- Terminal
			{
				-- https://github.com/akinsho/toggleterm.nvim
				"akinsho/toggleterm.nvim",
				keys = { "n", [[<c-;>]] },
				cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
				config = require("rc.config.toggleterm-nvim"),
			},
			-- Scrollbar
			{
				-- https://github.com/petertriho/nvim-scrollbar
				"petertriho/nvim-scrollbar",
				event = {
					"InsertEnter",
					"CursorHold",
					"FocusLost",
					"BufRead",
					"BufNewFile",
				},
				config = function()
					require("scrollbar").setup({})
				end,
			},
			{
				-- https://github.com/lewis6991/gitsigns.nvim
				"lewis6991/gitsigns.nvim",
				event = { "FocusLost", "CursorHold" },
				config = require("rc.config.gitsigns-nvim"),
			},
			-- Colorizer
			{
				-- https://github.com/norcalli/nvim-colorizer.lua
				"norcalli/nvim-colorizer.lua",
				cmd = { "ColorizerToggle" },
				config = function()
					require("colorizer").setup({})
				end,
			},
			-- Highlight length of search result
			{
				-- https://github.com/kevinhwang91/nvim-hlslens
				"kevinhwang91/nvim-hlslens",
				keys = { { "n", "*" }, { "n", "g*" }, { "n", "g*" } },
				event = { "CmdlineEnter" },
				module = { "hlslens" },
				requires = {
					-- https://github.com/rapan931/lasterisk.nvim
					"rapan931/lasterisk.nvim",
					module = { "lasterisk" },
				},
				wants = { "lasterisk.nvim" },
				setup = require("rc.setup.nvim-hlslens"),
				config = function()
					require("hlslens").setup()
				end,
			},
		}

		self._packer = packer
	end
	return self._packer
end

return Pack.new()
