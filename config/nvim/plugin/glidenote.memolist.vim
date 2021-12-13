" simple memo plugin for Vim.
" https://github.com/glidenote/memolist.vim

UsePlugin 'memolist.vim'

" suffix type (default markdown)
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_suffix = "txt"

" date format (default %Y-%m-%d %H:%M)
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"

" tags prompt (default 0)
let g:memolist_prompt_tags = 1

" categories prompt (default 0)
let g:memolist_prompt_categories = 1

" use qfixgrep (default 0)
let g:memolist_qfixgrep = 1

" use vimfiler (default 0)
let g:memolist_vimfiler = 1

" use fzf (default 0)
let g:memolist_fzf = 1

" remove filename prefix (default 0)
let g:memolist_filename_prefix_none = 1

" use unite (default 0)
let g:memolist_unite = 1

" use arbitrary unite source (default is 'file')
let g:memolist_unite_source = "file_rec"

" use arbitrary unite option (default is empty)
let g:memolist_unite_option = "-auto-preview -start-insert"

" use denite (default 0)
let g:memolist_denite = 1

" use arbitrary denite source (default is 'file_rec')
let g:memolist_denite_source = "anything"

" use arbitrary denite option (default is empty)
let g:memolist_denite_option = "anything"

" use various Ex commands (default '')
let g:memolist_ex_cmd = 'Defx'

" use delimiter of array in yaml front matter (default is ' ')
let g:memolist_delimiter_yaml_array = ','

" use when get items from yaml front matter
" first line string pattern of yaml front matter (default "==========")
let g:memolist_delimiter_yaml_start = "---"

" last line string pattern of yaml front matter (default "- - -")
let g:memolist_delimiter_yaml_end  = "---"
