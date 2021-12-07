" A blazing fast and easy to configure neovim statusline plugin written in pure lua.
" https://github.com/nvim-lualine/lualine.nvim

UsePlugin 'lualine.nvim'

lua << EOF

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

local function modified()
  if vim.bo.modified then
    return ' '
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return ' '
  end
  return ''
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
        'mode',
    },
    lualine_b = {
            modified,
            {
                'filename', file_status = false, path = 0,
            },
    },
    lualine_c = {
        'branch',
        {
            'diff',
            colored = true, -- displays diff status in color if set to true
            diff_color = {
                added    = 'DiffAdd',
                modified = 'DiffChange',
                removed  = 'DiffDelete',
            },
            symbols = {added = ' ', modified = ' ', removed = ' '},
        },
        search_result,
    },
    lualine_x = {
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
            symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
            colored = true,
            update_in_insert = false,
            always_visible = false,
        }
    },
    lualine_y = {'filetype', 'location'},
    lualine_z = {'progress'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'quickfix', 'fzf'}
}

EOF
