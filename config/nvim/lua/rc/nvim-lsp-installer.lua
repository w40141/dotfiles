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

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
local servers = installer.get_installed_servers()
for _, server in ipairs(servers) do
    local opts = { capabilities = capabilities, on_attach = on_attach, flags = lsp_flags }
    lspconfig[server.name].setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
end
