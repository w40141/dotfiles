" fzf vim
" https://github.com/junegunn/fzf.vim

UsePlugin 'fzf.vim'

" fzf settings
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

" Default fzf layout
" - Popup window (center of the screen)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"
" " - Popup window (center of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
"
" " - Popup window (anchored to the bottom of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
"
" " - down / up / left / right
" let g:fzf_layout = { 'down': '40%' }
"
" " - Window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors = {
  \ 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_buffers_jump = 1

augroup vimrc_fzf
    autocmd!
    autocmd FileType fzf tnoremap <buffer> <C-q> <Esc>
    autocmd FileType fzf tnoremap <buffer> <C-p> <UP>
    autocmd FileType fzf tnoremap <buffer> <C-n> <DOWN>
augroup END

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

" fzf settings
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" Filesコマンドにもプレビューを出す
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"" fzf.vim
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
function! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GFiles
    endif
endfunction

lua << EOF
local key = vim.api.nvim_set_keymap
key('n', '[ff]o', [[:call FzfOmniFiles()<cr>]], { noremap = true, silent = true })
key('n', '[ff]f', [[:Files<cr>]], { noremap = true, silent = true })
key('n', '[ff]g', [[:GFiles<cr>]], { noremap = true, silent = true })
key('n', '[ff]G', [[:GFiles?<cr>]], { noremap = true, silent = true })
key('n', '[ff]b', [[:Buffers<cr>]], { noremap = true, silent = true })

key('n', '[ff]w', [[vawy:RG <c-r>"<cr>]], { noremap = true, silent = true })
key('n', '[ff]r', [[:RG<cr>]], { noremap = true, silent = true })
key('n', '[ff]ll', [[:Lines<cr>]], { noremap = true, silent = true })
key('x', '[ff]w', [[y:RG <c-r>"<cr>]], { noremap = true, silent = true })
key('n', '[ff]lb', [[:BLines<cr>]], { noremap = true, silent = true })
key('n', '[ff]m', [[:Marks<cr>]], { noremap = true, silent = true })
key('n', '[ff]h', [[:History<cr>]], { noremap = true, silent = true })

key('i', '[ff]<c-f>', [[fzf#vim#complete#path('rg --files')]], { noremap = true, silent = true})
key('i', '[ff]<c-k>', [[fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})]], { noremap = true, silent = true})
key('i', '[ff]<c-w>', [[<plug>(fzf-complete-word)]], { noremap = true, silent = true})
key('i', '[ff]<c-p>', [[<plug>(fzf-complete-path)]], { noremap = true, silent = true})
key('i', '[ff]<c-i>', [[<plug>(fzf-complete-file-ag)]], { noremap = true, silent = true})
key('i', '[ff]<c-l>', [[<plug>(fzf-complete-line)]], { noremap = true, silent = true})
EOF
