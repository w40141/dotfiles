-- A snazzy bufferline for Neovim
-- https://github.com/akinsho/bufferline.nvim

-- UsePlugin 'bufferline.nvim'
--
-- lua << EOF
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering

local key = vim.api.nvim_set_keymap
key('n', '[b', [[:BufferLineCyclePrev<cr>]], { noremap = true, silent = true })
key('n', ']b', [[:BufferLineCycleNext<cr>]], { noremap = true, silent = true })

-- These commands will sort buffers by directory, language, or a custom criteria
key('n', 'bE', [[:BufferLineSortByExtension<cr>]], { noremap = true, silent = true })
key('n', 'bD', [[:BufferLineSortByDirectory<cr>]], { noremap = true, silent = true })
key('n', 'bg', [[:BufferLinePick<cr>]], { noremap = true, silent = true })

-- These commands will move the current buffer backwards or forwards in the bufferline
key('n', '<silent><leader>1', [[<Cmd>BufferLineGoToBuffer 1<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>2', [[<Cmd>BufferLineGoToBuffer 2<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>3', [[<Cmd>BufferLineGoToBuffer 3<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>4', [[<Cmd>BufferLineGoToBuffer 4<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>5', [[<Cmd>BufferLineGoToBuffer 5<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>6', [[<Cmd>BufferLineGoToBuffer 6<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>7', [[<Cmd>BufferLineGoToBuffer 7<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>8', [[<Cmd>BufferLineGoToBuffer 8<cr>]], { noremap = true, silent = true })
key('n', '<silent><leader>9', [[<Cmd>BufferLineGoToBuffer 9<cr>]], { noremap = true, silent = true })

vim.opt.termguicolors = true
require('bufferline').setup {
    options = {
        numbers = "buffer_id",
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '',
        close_icon = '',
        -- left_trunc_marker = '',
        -- right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        -- diagnostics = "coc",
        -- diagnostics_update_in_insert = false,
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --     local s = " "
        --     for e, n in pairs(diagnostics_dict) do
        --         local sym = e == "error" and " "
        --             or (e == "warning" and " " or " " )
        --         s = s .. n .. sym
        --     end
        --     return s
        -- end,
        -- custom_filter = function(buf_number)
        --     -- filter out filetypes you don't want to see
        --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --         return true
        --     end
        --     -- filter out by buffer name
        --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --         return true
        --     end
        --     -- filter out based on arbitrary rules
        --     -- e.g. filter out vim wiki buffer from tabline in your work repo
        --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --         return true
        --     end
        -- end,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'id'
    }
}
-- EOF
