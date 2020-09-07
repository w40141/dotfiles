"---------------------------------------------------------------------------
" vimtex.vim
"
let g:tex_flavor = "latex"

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
\ 'options' : [
\   '-pdf',
\   '-pdflatex="xelatex -synctex=1 \%S \%O"',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}

let g:vimtex_compiler_enabled = 1
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
" let g:vimtex_latexmk_background = 1
" let g:vimtex_latexmk_callback = 1
" let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
" let g:vimtex_latexmk_continuous = 1
" let g:vimtex_latexmk_enabled = 1
" let g:vimtex_latexmk_options = '-pdfdvi'
" let g:vimtex_toc_split_pos = "topleft"
" let g:vimtex_toc_width = 10
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_general_viewer
let g:vimtex_view_method = 'general'

function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
