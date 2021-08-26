" PowerLine
" https://github.com/itchyny/lightline.vim
" Colorscheme
" default, wombat, jellybeans, solarized dark, solarized light, PaperColor light, seoul256, one, landscape


UsePlugin 'lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \	'active': {
      \			'left': [
      \					['mode', 'paste'],
      \					['filename', 'fugitive', 'gitgutter'],
      \                 ['anzu'],
      \			],
      \			'right': [
      \					 ['percent', 'lineinfo'], 
      \					 ['coc'], 
      \					 ['eskk', 'filetype'], 
      \			], 
      \ }, 
      \	'inactive': {
      \			'left': [['vista']],
      \			'right': [['ale_error', 'ale_warning', 'ale_ok'],
      \               ['charcode', 'fileformat', 'fileencoding']
      \              ],
      \	}, 
      \	'component': {
      \			'lineinfo': '%3l[%L]:%-2v'
      \	},
      \ 'component_function': {
      \		'mode'        : 'MyMode', 
      \   	'fugitive'    : 'MyFugitive', 
      \   	'gitgutter'   : 'MyGitGutter', 
      \   	'filename'    : 'MyFilename', 
      \		'modified'	  : 'MyModified', 
      \   	'readonly'    : 'MyReadonly', 
      \   	'anzu'        : 'anzu#search_status',
      \		'charcode'	  : 'MyCharCode', 
      \   	'fileformat'  : 'MyFileformat', 
      \   	'fileencoding': 'MyFileencoding', 
      \   	'filetype'    : 'MyFiletype', 
      \		'coc'		  : 'MyCoc', 
      \     'eskk'        : 'MyEskk',
      \     'vista'       : 'MyVista',
      \ },
      \	'component_expand': {
      \			'ale_error'	  : 'MyAleError', 
      \			'ale_warning' : 'MyAleWarning', 
      \			'ale_ok'	  : 'MyAleOk', 
      \ }, 
      \ 'component_type': {
      \			'ale_error'	  : 'error', 
      \			'ale_warning' : 'warning', 
      \			'ale_ok'	  : 'ok', 
      \ },
      \ 'separator'     : {
      \			'left' : "\ue0b4",
      \			'right': "\ue0b6",
      \ }, 
      \ 'subseparator'  : {
      \			'left' : "\ue0b5", 
      \			'right': "\ue0b7",
      \ }
      \ }


" left
" MyMode
function! MyMode() abort
  return lightline#mode()
endfunction

" MyFugitive
function! MyFugitive() abort
  if winwidth(0) < 100
    return ''
  endif
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*FugitiveHead')
      let l:_ = g:fugitive#head()
      return strlen(l:_) ? "\uE0A0 " . l:_ : ''
    endif
  catch
  endtry
  return 'ab'
endfunction

" MyGitGutter
function! MyGitGutter() abort
  if winwidth(0) < 100
    return ''
  endif
  let l:gitgutter_sign_added = "\uF067 "
  let l:gitgutter_sign_modified = "\uF061 "
  let l:gitgutter_sign_removed = "\uF00D "

  let l:symbols = [
        \ l:gitgutter_sign_added,
        \ l:gitgutter_sign_modified,
        \ l:gitgutter_sign_removed
        \ ]
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 50
    return ''
  endif
  let l:hunks = g:GitGutterGetHunkSummary()
  let l:ret = []
  for l:i in [0, 1, 2]
    if l:hunks[l:i] > 0
      call add(l:ret, l:symbols[l:i] . l:hunks[l:i])
    endif
  endfor
  return join(l:ret, ' ')
endfunction

" MyFilename
function! MyFilename() abort
  if winwidth(0) >= 75
    return ('' != MyReadonly() ? MyReadonly() . '' : '') .
          \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != MyModified() ? '' . MyModified() : '')
  else
    return ('' != MyReadonly() ? MyReadonly() . '' : '') .
          \ ('' != MyModified() ? '' . MyModified() : '')
  endif
endfunction

" MyReadonly
function! MyReadonly() abort
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\uF23E " : ''
endfunction

" MyModified
function! MyModified() abort
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? " \uF040" : &modifiable ? '' : '-'
endfunction

" right
" MyCharCode
function! MyCharCode() abort
  if winwidth('.') >= 150
    redir => ascii
    silent! ascii
    redir END
    if match(ascii, 'NUL') != -1
      return 'NULL '
    endif
    let nrformat = '0x%02x'
    let encoding = (&fenc == '' ? &enc : &fenc)
    if encoding == 'utf-8'
      let nrformat = '0x%04x'
    endif
    let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')
    let nr = printf(nrformat, nr)
    return char . " " . nr . ''
  else
    return ''
  endif
endfunction

" MyFileformat
function! MyFileformat() abort
  let l:icon = exists('*WebDevIconsGetFileFormatSymbol()') ?
        \ ' ' . WebDevIconsGetFileFormatSymbol() : ''
  return winwidth(0) >= 150 ? &fileformat . l:icon : ''
endfunction

" MyFileencoding
function! MyFileencoding() abort
  return winwidth(0) >= 150 ? (strlen(&fenc) ? &fenc . '' : &enc) : ''
endfunction

" MyFiletype
function! MyFiletype() abort
  if strlen(&filetype) 
    return exists('*WebDevIconsGetFileTypeSymbol()') ?
          \ WebDevIconsGetFileTypeSymbol() : ''
    " let l:icon = exists('*WebDevIconsGetFileTypeSymbol()') ?
    "      \ WebDevIconsGetFileTypeSymbol() : ''
    " if winwidth(0) >= 100
    "   return &filetype . ' ' . l:icon
    " else
      " return l:icon
    " endif
  else
    return ''
  endif
endfunction

" MyCoc
function! MyCoc() abort
  return winwidth(0) >= 80 ? StatusDiagnostic() : ''
endfunction

function! StatusDiagnostic() abort
  let l:sign_error = "\uF490 "
  let l:sign_warning = "\uF4A3 "
  let l:sign_ok = "\uF4A1 "
  let l:sign_hint = "\uF685 "
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return l:sign_ok | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, l:sign_error . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, l:sign_warning . info['warning'])
  endif
  if get(info, 'hint', 0)
    call add(msgs, l:sign_hint . info['hint'])
  endif
  if msgs == []
    call add(msgs, l:sign_ok)
  endif
  return join(msgs, ' ')
endfunction

function! MyEskk() abort
    if (mode() == 'i') && eskk#is_enabled()
        return g:eskk#statusline()
    else
        return ''
    endif
endfunction

function! MyVista() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
