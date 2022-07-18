local function search_result()
    if vim.v.hlsearch == 0 then
        return ''
    end
    local last_search = vim.fn.getreg '/'
    if not last_search or last_search == '' then
        return ''
    end
    local searchcount = vim.fn.searchcount { maxcount = 9999 }
    return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function eskk()
    if (vim.fn.mode() == 'i') and vim.fn['eskk#is_enabled']() then
        return vim.fn['eskk#statusline']()
    else
        return ''
    end
end

require 'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'kanagawa',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = {
            'mode', eskk,
        },
        lualine_b = {
            { 'filename', file_status = true, path = 1, symbols = { modified = '  ', readonly = '  ' } },
        },
        lualine_c = {
            {
                'diagnostics',
                sources = { 'coc' },
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                    error = 'DiagnosticError',
                    warn  = 'DiagnosticWarn',
                    info  = 'DiagnosticInfo',
                    hint  = 'DiagnosticHint',
                },
                symbols = { Error = "", Warn = "", Hint = "", Info = "" },
                colored = true,
            },
            search_result,
        },
        lualine_x = {
            "aerial",
            depth = nil,
        },
        lualine_y = {
            {
                'diff',
                colored = true,
                diff_color = {
                    added    = 'DiffAdd',
                    modified = 'DiffChange',
                    removed  = 'DiffDelete',
                },
                symbols = { added = ' ', modified = ' ', removed = ' ' },
            },
            -- 'branch',
        },
        lualine_z = { 'location', 'progress' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { { 'filetype', icon_only = true } },
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'quickfix', 'fzf', 'nvim-tree', 'toggleterm', }
}
