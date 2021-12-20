" A 24bit dark Vim colorscheme based on sdras/night-owl-vscode-theme
" https://github.com/haishanh/night-owl.vim

UsePlugin 'night-owl.vim'

lua << EOF
if vim.fn.has("termguicolors") == true then
    vim.opt.termguicolors = true
end
vim.cmd("syntax enable")
vim.opt.background = "dark"
vim.cmd("colorscheme night-owl")
EOF
