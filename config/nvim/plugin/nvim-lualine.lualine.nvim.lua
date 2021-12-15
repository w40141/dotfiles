-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim

-- vim.cmd([[UsePlugin 'lualine.nvim']])

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

local function vista()
    if vim.b['vista_nearest_method_or_function'] then
        return vim.b['vista_nearest_method_or_function']
    else
        return ''
    end
end

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
        'mode', eskk,
    },
    lualine_b = {
            {
                'filename', file_status = true, path = 0,
                symbols = { modified = '  ', readonly = '  ' }
            },
    },
    lualine_c = {
        'branch',
        {
            'diff',
            colored = true,
            diff_color = {
                added    = 'DiffAdd',
                modified = 'DiffChange',
                removed  = 'DiffDelete',
            },
            symbols = {added = ' ', modified = ' ', removed = ' '},
        },
        search_result,
    },
    lualine_x = {},
    lualine_y = {
        vista,
        {
            'diagnostics',
            sources={'coc'},
            sections = {'error', 'warn', 'info', 'hint'},
            diagnostics_color = {
                error = 'DiagnosticError',
                warn  = 'DiagnosticWarn',
                info  = 'DiagnosticInfo',
                hint  = 'DiagnosticHint',
            },
            symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
            colored = true,
            update_in_insert = false,
            always_visible = false,
        },
    },
    lualine_z = {'location', 'progress'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {{'filetype', icon_only = true}},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'quickfix', 'fzf', 'nvim-tree', 'toggleterm', }
}
