local g = vim.g

g["test#strategy"] = "neoterm"
g["test#preserve_screen"] = 1
g["test#python#runner"] = "pytest"
g["test#java#runner"] = "gradletest"
g["test#go#runner"] = "ginkgo"

local key = vim.keymap.set
key("n", "t<c-n>", "<cmd>TestNeares<cr>")
key("n", "t<c-f>", "<cmd>TestFile<cr>")
key("n", "t<c-s>", "<cmd>TestSuite<cr>")
key("n", "t<c-l>", "<cmd>TestLast<cr>")
key("n", "t<c-g>", "<cmd>TestVisit<cr>")
