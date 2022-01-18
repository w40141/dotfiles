" Gruvbox with Material Palette
" https://github.com/sainnhe/gruvbox-material

UsePlugin 'gruvbox-material'

lua << EOF
if vim.fn.has("termguicolors") == true then
    vim.opt.termguicolors = true
end
vim.cmd("syntax enable")
vim.opt.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_statusline_style = "original"
vim.g.gruvbox_material_palette = "original"
vim.cmd("colorscheme gruvbox-material")
EOF
