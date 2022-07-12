require("trouble").setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics",
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example: close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = { "o" }, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = { "zM", "zm" }, -- close all folds
        open_folds = { "zR", "zr" }, -- open all folds
        toggle_fold = { "zA", "za" }, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    -- add an indent guide below the fold icons
    indent_lines = true,
    -- automatically open the list when you have diagnostics
    auto_open = false,
    -- automatically close the list when you have no diagnostics
    auto_close = true,
    -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_preview = true,
    -- automatically fold a file trouble list at creation
    auto_fold = true,
    -- for the given modes, automatically jump if there is only a single result
    auto_jump = { "lsp_definitions" },
    -- enabling this will use the signs defined in your lsp client
    use_diagnostic_signs = true
} -- Lua

local key = vim.keymap.set
local opts = { noremap = true, silent = true }
key("n", "<leader>t", "<cmd>TroubleToggle<cr>", opts)
key("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
key("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
key("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
key("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
key("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", opts)
