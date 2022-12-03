local g = vim.g

g["skkeleton#config"] = {
  globalJisyo = "~/.config/skk/SKK-JISYO.L",
  markerHenkan = "a",
}

local key = vim.keymap.set
local opt = { noremap = false, silent = false }
key("i", "jk", "<Plug>(skkeleton-toggle)", opt)
key("c", "jk", "<Plug>(skkeleton-toggle)", opt)
