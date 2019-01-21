"---------------------------------------------------------------------------
" watchdogs.vim
"

augroup MyAutoCmd
	autocmd InsertLeave,BufWritePost,TextChanged *.py WatchdogsRun
	autocmd BufRead,BufNewFile *.py WatchdogsRun
augroup END
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 1
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['watchdogs_checker/_'] = {
  \ 'outputter/quickfix/open_cmd': '',
  \ 'hook/qfsigns_update/enable_exit':  1,
  \ 'hook/qfsigns_update/priority_exit':4}

