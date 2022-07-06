local installer = require("nvim-lsp-installer")

installer.setup({
    ensure_installed = {},
    -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local d = vim.diagnostic
local opts = { noremap = true, silent = true }
local key = vim.keymap.set
key('n', '[dev]o', d.open_float, opts)
key('n', '[g', d.goto_prev, opts)
key('n', ']g', d.goto_next, opts)
key('n', '[dev]q', d.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local buf = vim.lsp.buf
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    key('n', '[dev]D', buf.declaration, bufopts)
    key('n', '[dev]d', buf.definition, bufopts)
    key('n', '[dev]h', buf.hover, bufopts)
    key('n', '[dev]i', buf.implementation, bufopts)
    key('n', '[dev]s', buf.signature_help, bufopts)
    key('n', '[dev]wa', buf.add_workspace_folder, bufopts)
    key('n', '[dev]wr', buf.remove_workspace_folder, bufopts)
    key('n', '[dev]wl', function()
        print(vim.inspect(buf.list_workspace_folders()))
    end, bufopts)
    key('n', '[dev]t', buf.type_definition, bufopts)
    key('n', '[dev]n', buf.rename, bufopts)
    key('n', '[dev]a', buf.code_action, bufopts)
    key('n', '[dev]r', buf.references, bufopts)
    key('n', '[dev]f', buf.formatting, bufopts)
end
local lsp_flags = {
    debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = installer.get_installed_servers()
for _, server in ipairs(servers) do
    local opts = { capabilities = capabilities, on_attach = on_attach, flags = lsp_flags }
    require('lspconfig')[server.name].setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
end
