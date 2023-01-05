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
	local api = vim.api
	local cmp = require("cmp")
	local snip = require("luasnip")
	local has_words_before = function()
		unpack = unpack or table.unpack
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
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
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
		experimental = {
			ghost_text = true,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			-- { name = "nvim_lsp_signature_help" },
			{ name = "nvim_lsp_document_symbol" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "mocword" },
			{ name = "treesitter", trigger_characters = { "." }, option = {} },
		}),
	})

	cmp.setup.cmdline("/", {
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
	require("lsp_signature").setup({ hint_enable = false })
end

function M.autopairs()
	require("nvim-autopairs").setup()
end

return M
