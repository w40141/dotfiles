local actions = require("telescope.actions")
local telescope_builtin = require("telescope.builtin")
local action_layout = require("telescope.actions.layout")
local config = require("telescope.config")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local previewers = require("telescope.previewers")
local utils = require("telescope.utils")
local conf = require("telescope.config").values
local Path = require("plenary.path")

local action_state = require("telescope.actions.state")
local custom_actions = {}
--
function custom_actions._multiopen(prompt_bufnr, open_cmd)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = #picker:get_multi_selection()
    if num_selections > 1 then
        vim.cmd("bw!")
        for _, entry in ipairs(picker:get_multi_selection()) do
            vim.cmd(string.format("%s %s", open_cmd, entry.value:match("([^:]+)")))
        end
        vim.cmd("stopinsert")
    else
        if open_cmd == "vsplit" then
            actions.file_vsplit(prompt_bufnr)
        elseif open_cmd == "split" then
            actions.file_split(prompt_bufnr)
        elseif open_cmd == "tabe" then
            actions.file_tab(prompt_bufnr)
        else
            actions.file_edit(prompt_bufnr)
        end
    end
end

function custom_actions.multi_selection_open_vsplit(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "vsplit")
end
function custom_actions.multi_selection_open_split(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "split")
end
function custom_actions.multi_selection_open_tab(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "tabe")
end
function custom_actions.multi_selection_open(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "edit")
end
--
require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        -- file_sorter = require("telescope.sorters").get_fuzzy_file,
        -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        dynamic_preview_title = true,
        winblend = 0,
        color_devicons = true,
        use_less = true,
        scroll_strategy = "cycle",
        set_env = { ["COLORTERM"] = "truecolor" }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe

        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["<C-t>"] = action_layout.toggle_preview },
            i = {
                ["<C-t>"] = action_layout.toggle_preview,
                ["<C-x>"] = false,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-g>"] = custom_actions.multi_selection_open,
            },
        },
    },
    extensions = {
        -- media_files = {
        --     filetypes = { "png", "webp", "jpg", "jpeg" }, -- filetypes whitelist
        --     find_cmd = "rg", -- find command
        -- },
        -- arecibo = {
        --     ["selected_engine"] = "google",
        --     ["url_open_command"] = "xdg-open",
        --     ["show_http_headers"] = false,
        --     ["show_domain_icons"] = false,
        -- },
        -- frecency = {
        --     db_root = vim.fn.stdpath("state"),
        --     ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
        --     db_safe_mode = false,
        --     auto_validate = true,
        -- },
        -- project = {
        --     base_dirs = (function()
        --         local dirs = {}
        --         local function file_exists(fname)
        --             local stat = vim.loop.fs_stat(vim.fn.expand(fname))
        --             return (stat and stat.type) or false
        --         end
        --         if file_exists("~/.ghq") then
        --             dirs[#dirs + 1] = { "~/.ghq", max_depth = 5 }
        --         end
        --         if file_exists("~/Workspace") then
        --             dirs[#dirs + 1] = { "~/Workspace", max_depth = 3 }
        --         end
        --         if #dirs == 0 then
        --             return nil
        --         end
        --         return dirs
        --     end)(),
        -- },
    },
})

local key = vim.api.nvim_set_keymap

key("n", "[ff]P", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
key("n", "[ff]p", "<Cmd>Telescope git_files<CR>", { noremap = true, silent = true })
key("n", "[ff]g", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
key("n", "[ff]f", "<Cmd>Telescope grep_string<CR>", { noremap = true, silent = true })
key("n", "[ff]b", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })
key("n", "[ff]l", "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", { noremap = true, silent = true })

key("n", "[ff]t", "<Cmd>Telescope treesitter<CR>", { noremap = true, silent = true })
key("n", "[ff]q", "<Cmd>Telescope quickfix<CR>", { noremap = true, silent = true })

key("n", "[ff]gs", "<Cmd>lua require('telescope.builtin').git_status()<CR>", { noremap = true, silent = true })
key("n", "[ff]gc", "<Cmd>lua require('telescope.builtin').git_commits()<CR>", { noremap = true, silent = true })
key("n", "[ff]gC", "<Cmd>lua require('telescope.builtin').git_bcommits()<CR>", { noremap = true, silent = true })
key("n", "[ff]gb", "<Cmd>lua require('telescope.builtin').git_branches()<CR>", { noremap = true, silent = true })
