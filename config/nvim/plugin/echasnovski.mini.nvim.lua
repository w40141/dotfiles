-- Neovim plugin with collection of minimal, independent, and fast Lua modules dedicated to improve Neovim (version 0.5 and higher) experience
-- https://github.com/echasnovski/mini.nvim

require('mini.surround').setup({
    -- Number of lines within which surrounding is searched
    n_lines = 20,

    -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    highlight_duration = 500,

    custom_surroundings = {
      -- Make `)` insert parts with spaces. `input` pattern stays the same.
      [')'] = { output = { left = '( ', right = ' )' } },

      -- Modify `f` (function call) to find functions with only alphanumeric
      -- characters in its name.
      f = { input = { find = '%f[%w]%w+%b()' } },

      -- Create custom surrouding for Lua's block string `[[...]]`
      s = {
        input = { find = '%[%[.-%]%]', extract = '^(..).*(..)$' },
        output = { left = '[[', right = ']]' },
      },
    },

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        add = 'sa', -- Add surrounding
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sH', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`
    },
})
