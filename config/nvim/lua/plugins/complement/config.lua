local M = {}

function M.luasnip()
	require("luasnip").config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
	})
	require("luasnip.loaders.from_vscode").lazy_load()
end

function M.skkeleton()
	local fn = vim.fn
	fn["skkeleton#config"]({
		globalJisyo = "$XDG_CONFIG_HOME/skk/SKK-JISYO.L",
		userJisyo = "$XDG_CONFIG_HOME/skk/SKK-JISYO.S",
		eggLikeNewline = true,
		useSkkServer = true,
		immediatelyCancel = false,
		registerConvertResult = true,
	})
end

function M.cmp()
	local v = vim
	local api = v.api
	local cmp = require("cmp")
	local snip = require("luasnip")
	local has_words_before = function()
		unpack = unpack or table.unpack
		if api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end
		local line, col = unpack(api.nvim_win_get_cursor(0))
		return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	cmp.setup({
		formatting = {
			format = require("lspkind").cmp_format({
				maxwidth = 50,
				menu = {
					buffer = "[BUF]",
					nvim_lsp = "[LSP]",
					luasnip = "[SNP]",
					path = "[PTH]",
					spell = "[SPL]",
					treesitter = "[TST]",
					copilot = "[COP]",
				},
				symbol_map = {
					Copilot = "",
				},
			}),
		},
		snippet = {
			expand = function(args)
				snip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<C-,>"] = cmp.mapping.complete(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-f>"] = cmp.mapping.scroll_docs(-4),
			["<C-b>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<C-j>"] = cmp.mapping(function(fallback)
				if snip.expand_or_jumpable() then
					snip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
					snip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-k>"] = cmp.mapping(function(fallback)
				if snip.jumpable(-1) then
					snip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Tab>"] = v.schedule_wrap(function(fallback)
				if cmp.visible() and has_words_before() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end),
			-- ["<Tab>"] = cmp.mapping(function(fallback)
			-- 	if cmp.visible() then
			-- 		cmp.select_next_item()
			-- 	else
			-- 		fallback()
			-- 	end
			-- end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		experimental = {
			ghost_text = true,
		},
		sources = cmp.config.sources({
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lsp_document_symbol" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "luasnip" },
			{
				name = "treesitter",
				trigger_characters = { "." },
				option = {},
			},
			{
				name = "spell",
				option = {
					keep_all_entries = false,
					enable_in_context = function()
						return true
					end,
				},
			},
			-- { name = "skkeleton" },
		}),
		-- view = {
		--   entries = 'native'
		-- }
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "nvim_lsp_document_symbol" },
			{ name = "buffer" },
		}, {}),
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			{ name = "cmdline" },
		}, {}),
	})

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

function M.signature()
	require("lsp_signature").setup({ hint_prefix = "󰛨 " })
end

function M.autopairs()
	require("nvim-autopairs").setup()
end

function M.copilot()
	require("copilot").setup({
		panel = {
			enabled = false,
			auto_refresh = false,
			keymap = {
				jump_prev = "[[",
				jump_next = "]]",
				accept = "<CR>",
				refresh = "gr",
				open = "<M-CR>",
			},
			layout = {
				position = "bottom", -- | top | left | right
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = false,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<M-l>",
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
		},
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 16.x
		server_opts_overrides = {},
	})
end

return M
