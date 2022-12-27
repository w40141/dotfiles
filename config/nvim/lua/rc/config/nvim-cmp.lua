return {
	function()
		local cmp = require("cmp")
		local fn = vim.fn
		local luasnip = require("luasnip")

		cmp.setup({
			formatting = {
				format = require("lspkind").cmp_format({
					maxwidth = 50,
					menu = {
						buffer = "[BUF]",
						nvim_lsp = "[LSP]",
						snippy = "[SNP]",
						path = "[PTH]",
						spell = "[SPL]",
						treesitter = "[TST]",
					},
				}),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-f>"] = cmp.mapping.scroll_docs(-4),
				["<C-b>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-j>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-k>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					local col = fn.col "." - 1
					if cmp.visible() then
						cmp.select_next_item()
					elseif col == 0 or fn.getline("."):sub(col, col):match "%s" then
						fallback()
					else
						cmp.complete()
					end
				end, { "i", "s" }),
				["<S-Tab"] = cmp.mapping(function(fallback)
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
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp_document_symbol" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "mocword" },
				{ name = "treesitter", trigger_characters = { "." }, option = {} },
				-- {
				-- 	name = 'spell',
				-- 	option = {
				-- 		keep_all_entries = false,
				-- 		enable_in_context = function()
				-- 			return true
				-- 		end,
				-- 	},
				-- },
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

		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		cmp.event:on(
			'confirm_done',
			cmp_autopairs.on_confirm_done()
		)
	end
}
