local M = {}

function M.luasnip()
	require("luasnip").config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
	})
	require("luasnip.loaders.from_vscode").lazy_load()
end

function M.cmp()
	local v = vim
	local api = v.api
	local cmp = require("cmp")
	local has_words_before = function()
		if api.nvim_get_option_value("buftype", {}) == "prompt" then
			return false
		end
		local line, col = unpack(api.nvim_win_get_cursor(0))
		return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	cmp.setup({
		preselect = cmp.PreselectMode.None,
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
				},
				symbol_map = {
					Copilot = "",
				},
			}),
			expandable_indicator = true,
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() and cmp.get_selected_entry() then
					cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					})
				elseif cmp.visible() then
					cmp.abort()
				else
					fallback()
				end
			end, { "i", "s" }),
			-- ["<C-,>"] = cmp.mapping.complete(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-f>"] = cmp.mapping.scroll_docs(-4),
			["<C-b>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<C-j>"] = cmp.mapping(function(fallback)
				local snip = require("luasnip")
				if snip.expand_or_jumpable() then
					snip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-k>"] = cmp.mapping(function(fallback)
				local snip = require("luasnip")
				if snip.jumpable(-1) then
					snip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() and has_words_before() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
		experimental = {
			ghost_text = true,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp", priority = 1000 },
			{ name = "copilot", priority = 900 },
			{ name = "luasnip", priority = 800 },
			{ name = "path", priority = 700 },
			{ name = "buffer", priority = 500, keyword_length = 3 },
			{ name = "treesitter", priority = 400, trigger_characters = { "." } },
			{ name = "cmp_yanky", priority = 300, keyword_length = 3 },
			{
				name = "spell",
				priority = 200,
				keyword_length = 4,
				option = {
					keep_all_entries = false,
					-- enable_in_context = function()
					-- 	return true
					-- end,
				},
			},
			{ name = "lazydev", priority = 100, group_index = 0 },
		}),
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
end

return M
