-- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
-- https://github.com/rebelot/kanagawa.nvim

if vim.fn.has("termguicolors") == true then
    vim.opt.termguicolors = true
end
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords 
    transparent = false,        -- do not set background color
    colors = {},
    overrides = {},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
