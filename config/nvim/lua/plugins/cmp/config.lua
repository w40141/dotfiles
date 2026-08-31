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

	local skk_source = require("plugins.cmp.skk")

	cmp.register_source(
		"skk",
		skk_source.new({
			max_readings = 20,
			max_items = 50,
		})
	)

	local has_words_before = function()
		if api.nvim_get_option_value("buftype", {}) == "prompt" then
			return false
		end
		local line, col = unpack(api.nvim_win_get_cursor(0))
		return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local skk_group = api.nvim_create_augroup("CmpSkk", { clear = true })
	local skk_passthrough_guard_set = false

	api.nvim_create_autocmd("User", {
		group = skk_group,
		pattern = "SkkHenkanChanged",
		callback = function()
			if not skk_passthrough_guard_set then
				local ok_capture, capture = pcall(require, "skk.capture")
				if ok_capture then
					capture.set_passthrough_guard(function()
						return cmp.visible()
					end)
					skk_passthrough_guard_set = true
				end
			end

			vim.schedule(function()
				local ok, state = pcall(require, "skk.henkan.state")
				if not ok then
					return
				end

				local phase = state.get_phase()
				local reading = state.current_reading()

				if (phase == "midashi" or phase == "abbrev") and reading and reading ~= "" then
					cmp.complete({
						config = {
							sources = {
								{
									name = "skk",
									priority = 2000,
									keyword_length = 0,
									keyword_pattern = [[\%x00]],
								},
							},
						},
					})
				elseif cmp.visible() then
					cmp.abort()
				end
			end)
		end,
	})

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
					copilot = "[COP]",
					cmp_yanky = "[YNK]",
					skk = "[SKK]",
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
					local ok, state = pcall(require, "skk.henkan.state")

					if ok and state.is_active() then
						cmp.abort()

						local ok_skk, skk = pcall(require, "skk")
						if ok_skk then
							skk.confirm_henkan()
						end
					else
						cmp.abort()
					end
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
				if cmp.visible() then
					cmp.select_next_item({
						behavior = cmp.SelectBehavior.Select,
					})
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
			{ name = "lazydev", priority = 100, group_index = 0 },

			{
				name = "nvim_lsp",
				priority = 1000,
			},
			{
				name = "copilot",
				priority = 900,
				max_item_count = 3,
			},
			{
				name = "luasnip",
				priority = 800,
				max_item_count = 5,
			},
			{
				name = "path",
				priority = 700,
				max_item_count = 10,
			},
			{
				name = "buffer",
				priority = 500,
				keyword_length = 3,
				max_item_count = 5,
			},
			{
				name = "cmp_yanky",
				priority = 300,
				keyword_length = 3,
				max_item_count = 3,
			},
			{
				name = "spell",
				priority = 200,
				keyword_length = 4,
				max_item_count = 5,
				option = {
					keep_all_entries = false,
					enable_in_context = function()
						return require("cmp.config.context").in_treesitter_capture("spell")
					end,
				},
			},
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
