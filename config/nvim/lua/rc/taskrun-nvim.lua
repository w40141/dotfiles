require("taskrun").setup()
vim.api.nvim_set_keymap("n", "[dev]m", "<Cmd>TaskRunToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[dev]l", "<Cmd>TaskRunLast()<CR>", { noremap = true, silent = true })
