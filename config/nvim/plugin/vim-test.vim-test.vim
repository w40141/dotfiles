" Run your tests at the speed of thought
" https://github.com/vim-test/vim-test

UsePlugin 'vim-test'

lua << EOF
-- these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
vim.api.nvim_set_keymap('n', 't<c-n>', [[:TestNeares<cr>]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 't<c-f>', [[:TestFile<cr>]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 't<c-s>', [[:TestSuite<cr>]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 't<c-l>', [[:TestLast<cr>]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 't<c-g>', [[:TestVisit<cr>]], { noremap = false, silent = true })
vim.g["test#strategy"] = "neoterm"
vim.g["test#preserve_screen"] = 1
vim.g["test#python#runner"] = "pytest"
vim.g["test#java#runner"] = "gradletest"
vim.g["test#go#runner"] = "ginkgo"
EOF

" let g:test#strategy = 'neoterm
" let g:test#preserve_screen = 1
" let g:test#python#runner = 'pytest'
" let g:test#java#runner = 'gradletest'
" let g:test#go#runner = 'ginkgo'
" Runners available are 'gotest', 'ginkgo', 'richgo', 'delve'
