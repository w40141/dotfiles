local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local action_state = require("telescope.actions.state")
local custom_actions = {}

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

local trouble = require("trouble.providers.telescope")
telescope.setup({
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
        path_display = { "truncate" },
        dynamic_preview_title = true,
        winblend = 0,
        color_devicons = true,
        use_less = true,
        scroll_strategy = "cycle",
        set_env = { ["COLORTERM"] = "truecolor" },
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = {
                ["<C-t>"] = action_layout.toggle_preview,
                ["<c-o>"] = trouble.open_with_trouble,
            },
            i = {
                ["<c-o>"] = trouble.open_with_trouble,
                ["<C-t>"] = action_layout.toggle_preview,
                ["<C-x>"] = false,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-g>"] = custom_actions.multi_selection_open,
            },
        },
        extensions = {
            aerial = {
                -- Display symbols as <root>.<parent>.<symbol>
                show_nesting = true
            }
        }
    },
    extensions = {
        coc
    },
})
telescope.load_extension('coc')

local key = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
key("n", "[ff]p", builtin.find_files, opts)
key("n", "[ff]f", builtin.git_files, opts)
key("n", "[ff]g", builtin.live_grep, opts)
key("n", "[ff]/", builtin.grep_string, opts)
key("n", "[ff]b", builtin.buffers, opts)
key("n", "[ff]l", builtin.current_buffer_fuzzy_find, opts)
key("n", "[ff]t", "<Cmd>Telescope treesitter<CR>", opts)
key("n", "[ff]q", "<Cmd>Telescope quickfix<CR>", opts)
key("n", "[ff]gs", builtin.git_status, opts)
key("n", "[ff]gc", builtin.git_commits, opts)
key("n", "[ff]gC", builtin.git_bcommits, opts)
key("n", "[ff]gb", builtin.git_branches, opts)
-- key('n', '[ff]q', [[:<c-u>CocCommand fzf-preview.CocDiagnostics<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]r', [[:<c-u>CocCommand fzf-preview.CocReferences<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]d', [[:<c-u>CocCommand fzf-preview.CocDefinition<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]t', [[:<c-u>CocCommand fzf-preview.CocTypeDefinition<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]o', [[:<c-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<cr>]],
--     { noremap = true, silent = true })
-- mru
-- links
-- commands
-- locations
-- references
-- definitions
-- declarations
-- implementations
-- type_definitions
-- diagnostics
-- code_actions
-- line_code_actions
-- file_code_actions
-- document_symbols
-- workspace_symbols
-- workspace_diagnostics
