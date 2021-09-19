" eskk is pure Vim script implementation of input method engine SKK
" https://github.com/tyru/eskk.vim
"
" https://zenn.dev/kouta/articles/87947515bff4da
" https://hakasenote.hnishi.com/2021/20210105-vim-eskk/

UsePlugin 'eskk.vim'

let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'utf-8',}

let g:eskk#kakutei_when_unique_candidate = 1 "漢字変換した時に候補が1つの場合、自動的に確定する
let g:eskk#enable_completion = 0             "neocompleteを入れないと、1にすると動作しなくなるため0推奨
let g:eskk#no_default_mappings = 1           "デフォルトのマッピングを削除
let g:eskk#keep_state = 0                    "ノーマルモードに戻るとeskkモードを初期値にする
let g:eskk#egg_like_newline = 1              "漢字変換を確定しても改行しない。
let g:eskk#log_cmdline_level = 3

"表示文字を変更(オレ サンカクデ ハンダン デキナイ)
let g:eskk#marker_henkan = "[変換]"
let g:eskk#marker_henkan_select = "[選択]"
let g:eskk#marker_okuri = "[送り]"
let g:eskk#marker_jisyo_touroku = "[辞書]"

augroup vimrc_eskk
  autocmd!
  "markdownは日本語を打つ前提
  autocmd InsertEnter * call s:markdown_eskk()
  autocmd InsertEnter *.md if g:toggle_markdown_eskk | call eskk#enable() | endif
  autocmd Filetype markdown nnoremap <buffer><silent> <F1> :call <SID>markdown_eskk_toggle()<CR>
  autocmd User eskk-enable-post lmap <buffer> l <Plug>(eskk:disable)
augroup END

let g:toggle_markdown_eskk = 1
function! s:markdown_eskk() abort
  if &filetype == 'markdown' && g:toggle_markdown_eskk ==# 1
    call eskk#enable()
  endif
endfunction

augroup vimrc_eskk
  autocmd!
augroup END

imap <jk> <Plug>(eskk:toggle)
cmap <jk> <Plug>(eskk:toggle)

inoremap <silent><expr> ;; pumvisible() ? coc#_select_confirm() : coc#refresh()
