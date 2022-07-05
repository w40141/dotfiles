local key = vim.api.nvim_set_keymap
key('n', 't<c-n>', [[:TestNeares<cr>]], { noremap = false, silent = true })
key('n', 't<c-f>', [[:TestFile<cr>]], { noremap = false, silent = true })
key('n', 't<c-s>', [[:TestSuite<cr>]], { noremap = false, silent = true })
key('n', 't<c-l>', [[:TestLast<cr>]], { noremap = false, silent = true })
key('n', 't<c-g>', [[:TestVisit<cr>]], { noremap = false, silent = true })
vim.g["test#strategy"] = "neoterm"
vim.g["test#preserve_screen"] = 1
vim.g["test#python#runner"] = "pytest"
vim.g["test#java#runner"] = "gradletest"
vim.g["test#go#runner"] = "ginkgo"
