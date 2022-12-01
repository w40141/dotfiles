local cmp = require("cmp")

cmp.setup({
	formatting = {
		format = require("lspkind").cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
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
			require("snippy").expand_snippet(args.body)
		end,
	},
	window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-l>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	experimental = {
		ghost_text = true,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp_document_symbol" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "snippy" },
		{ name = "mocword" },
		{ name = "treesitter" },
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
	}),
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
		{ name = "buffer" },
	}, {}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}, {}),
})

-- autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
