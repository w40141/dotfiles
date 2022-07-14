local cmp = require 'cmp'

cmp.setup({
    formatting = {
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                snippy = "[Snippy]",
                nvim_lua = "[NeovimLua]",
                latex_symbols = "[LaTeX]",
                path = "[Path]",
                omni = "[Omni]",
                spell = "[Spell]",
                emoji = "[Emoji]",
                treesitter = "[TS]",
                mocword = "[mocword]",
            },
        }),
    },
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "emoji" },
        { name = "snippy" },
        { name = "nvim_lsp_signature_help" },
        { name = "mocword" },
        { name = "buffer" },
        { name = "omni" },
        { name = "spell" },
        { name = "treesitter" },
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
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})

-- autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))