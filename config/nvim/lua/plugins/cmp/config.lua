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
		globalDictionaries = {
			{
				"~/.config/skk/SKK-JISYO.L",
				"utf-8",
			},
		},
		eggLikeNewline = true,
		registerConvertResult = true,
	})
end

function M.cmp()
	local v = vim
	local api = v.api
	local cmp = require("cmp")
	local snip = require("luasnip")
	local has_words_before = function()
		if api.nvim_get_option_value("buftype", {}) == "prompt" then
			return false
		end
		local line, col = unpack(api.nvim_win_get_cursor(0))
		return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	cmp.setup({
		performance = {
			debounce = 0,
			throttle = 0,
		},
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
					cmp_yanky = "[YNK]",
					skkeleton = "[SKK]",
				},
				symbol_map = {
					Copilot = "",
				},
			}),
			expandable_indicator = true,
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
			-- ["<C-,>"] = cmp.mapping.complete(),
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
			{ name = "cmp_yanky" },
			-- { name = "orgmode" },
			{ name = "skkeleton" },
			{
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			},
		}),
		-- view = {
		-- 	entries = "native",
		-- },
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

return M
