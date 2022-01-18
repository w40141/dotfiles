" eskk is pure Vim script implementation of input method engine SKK
" https://github.com/tyru/eskk.vim
"
" https://zenn.dev/kouta/articles/87947515bff4da
" https://hakasenote.hnishi.com/2021/20210105-vim-eskk/

" UsePlugin 'eskk.vim'

augroup vimrc_eskk
  autocmd!
  "markdownは日本語を打つ前提
  autocmd InsertEnter * call s:markdown_eskk()
  autocmd InsertEnter *.md if g:toggle_markdown_eskk | call eskk#enable() | endif
  autocmd Filetype markdown nnoremap <buffer> <silent> <F1> :call <SID>markdown_eskk_toggle()<CR>
  autocmd User eskk-enable-post lmap <buffer> l <plug>(eskk:disable)
augroup END

let g:toggle_markdown_eskk = 1
function! s:markdown_eskk() abort
  if &filetype == 'markdown' && g:toggle_markdown_eskk ==# 1
    call eskk#enable()
  endif
endfunction

lua << EOF
vim.g["eskk#directory"] = "~/.config/eskk"
vim.g["eskk#dictionary"] = { path = "~/.config/eskk/my_jisyo", sorted = 1, encoding = "utf-8"}
vim.g["eskk#large_dictionary"] = { path = "~/.config/eskk/SKK-JISYO.L", sorted = 1, encoding = "utf-8"}

-- 漢字変換した時に候補が1つの場合、自動的に確定する
vim.g["eskk#kakutei_when_unique_candidate"] = 1
-- neocompleteを入れないと、1にすると動作しなくなるため0推奨
vim.g["eskk#enable_completion"] = 0
-- デフォルトのマッピングを削除
vim.g["eskk#no_default_mappings"] = 1
-- ノーマルモードに戻るとeskkモードを初期値にする
vim.g["eskk#keep_state"] = 0
-- 漢字変換を確定しても改行しない。
vim.g["eskk#egg_like_newline"] = 1
vim.g["eskk#log_cmdline_level"] = 3

-- 表示文字を変更
vim.g["eskk#marker_henkan"] = "[変換]"
vim.g["eskk#marker_henkan_select"] = "[選択]"
vim.g["eskk#marker_okuri"] = "[送り]"
vim.g["eskk#marker_jisyo_touroku"] = "[辞書]"

local key = vim.api.nvim_set_keymap
key('i', 'jk', [[<plug>(eskk:toggle)]], { noremap = false, silent = true })
key('i', ';;', [[pumvisible() ? coc#_select_confirm() : coc#refresh()]], { expr = true, noremap = true, silent = true })
key('c', 'jk', [[<plug>(eskk:toggle)]], { noremap = false, silent = true })
EOF
