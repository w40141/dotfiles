local g = vim.g

g["test#strategy"] = "neoterm"
g["test#preserve_screen"] = 1
g["test#python#runner"] = "pytest"
g["test#java#runner"] = "gradletest"
g["test#go#runner"] = "ginkgo"

local key = vim.keymap.set
key("n", "t<c-n>", "<cmd>TestNeares<cr>", { noremap = false, silent = true })
key("n", "t<c-f>", "<cmd>TestFile<cr>", { noremap = false, silent = true })
key("n", "t<c-s>", "<cmd>TestSuite<cr>", { noremap = false, silent = true })
key("n", "t<c-l>", "<cmd>TestLast<cr>", { noremap = false, silent = true })
key("n", "t<c-g>", "<cmd>TestVisit<cr>", { noremap = false, silent = true })
