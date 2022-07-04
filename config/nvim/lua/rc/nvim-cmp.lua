vim.g.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'

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
        { name = "nvim_lsp", priority = 100 },
        { name = "path", priority = 100 },
        { name = "emoji", insert = true, priority = 60 },
        { name = "nvim_lua", priority = 50 },
        { name = "nvim_lsp_signature_help", priority = 80 },
        -- { name = "skkeleton", priority = 40 },
    }, {
        { name = "buffer", priority = 50 },
        { name = "omni", priority = 40 },
        { name = "spell", priority = 40 },
        { name = "treesitter", priority = 30 },
    }),
    -- view = {
    --     entries = 'native'
    -- }
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
    sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
})
