set rtp+=/usr/local/opt/fzf
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '30%' }
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-j': 'split',
            \ 'ctrl-l': 'vsplit' }

augroup vimrc_fzf
    autocmd!
    autocmd FileType fzf tnoremap <buffer> <leader>z <Esc>
augroup END

"" fzf.vim
" <C-p>でファイル検索を開く
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

" <C-g>で文字列検索を開く
" <S-?>でプレビューを表示/非表示する
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<CR>

" frでカーソル位置の単語をファイル検索する
nnoremap fr vawy:Rg <C-R>"<CR>
" frで選択した単語をファイル検索する
xnoremap fr y:Rg <C-R>"<CR>

" fbでバッファ検索を開く
nnoremap fb :Buffers<CR>
" fpでバッファの中で1つ前に開いたファイルを開く
nnoremap fp :Buffers<CR><CR>
" flで開いているファイルの文字列検索を開く
nnoremap fl :BLines<CR>
" fmでマーク検索を開く
nnoremap fm :Marks<CR>
" fhでファイル閲覧履歴検索を開く
nnoremap fh :History<CR>
" fcでコミット履歴検索を開く
nnoremap fc :Commits<CR>

nnoremap <silent> ff :<C-u>Ag<CR>
nnoremap <silent> ft :<C-u>call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <silent> fgs :<C-u>GFiles?<CR>
nnoremap <silent> fgf :<C-u>GFiles<CR>
