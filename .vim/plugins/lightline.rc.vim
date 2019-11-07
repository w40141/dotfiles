"---------------------------------------------------------------------------
" lightline.vim
"

"colorscheme -> default, wombat, jellybeans, solarized dark, solarized light,
"               PaperColor light, seoul256, one, landscape
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \	'active': {
            \			'left': [
            \					['mode', 'paste'], 
            \					['fugitive', 'gitgutter', 'filename', 'anzu'], 
            \			], 
            \			'right': [
            \					['percent', 'lineinfo'], 
            \					['coc'], 
            \					['charcode', 'fileformat', 'fileencoding', 'filetype'], 
            \			], 
            \ }, 
            \	'inactive': {
            \			'left': [],
            \			'right': [['ale_error', 'ale_warning', 'ale_ok']]
            \	}, 
            \	'component': {
            \			'lineinfo': '%3l[%L]:%-2v'
            \	},
            \ 'component_function': {
            \			'mode'        : 'MyMode', 
            \   	'fugitive'    : 'MyFugitive', 
            \   	'gitgutter'   : 'MyGitGutter', 
            \   	'filename'    : 'MyFilename', 
            \			'modified'		: 'MyModified', 
            \   	'readonly'    : 'MyReadonly', 
            \   	'anzu'        : 'anzu#search_status', 
            \			'charcode'		: 'MyCharCode', 
            \   	'fileformat'  : 'MyFileformat', 
            \   	'fileencoding': 'MyFileencoding', 
            \   	'filetype'    : 'MyFiletype', 
            \			'coc'					: 'MyCoc', 
            \ },
            \	'component_expand': {
            \			'ale_error'		:	'MyAleError', 
            \			'ale_warning'	:	'MyAleWarning', 
            \			'ale_ok'			:	'MyAleOk', 
            \ }, 
            \ 'component_type': {
            \			'ale_error'		:	'error', 
            \			'ale_warning'	:	'warning', 
            \			'ale_ok'			:	'ok', 
            \ }, 
            \ 'separator'     : {
            \			'left' : "\uE0B0", 
            \			'right': "\uE0B2", 
            \ }, 
            \ 'subseparator'  : {
            \			'left' : "\uE0B1", 
            \			'right': "\uE0B3", 
            \ }
            \ }

" left
" MyMode
function! MyMode()
	return winwidth(0) > 100 ? lightline#mode() : ''
endfunction

" MyFugitive
function! MyFugitive()
    if winwidth(0) < 100
        return ''
    endif
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            let l:_ = g:fugitive#head()
            return strlen(l:_) ? "\uE0A0" . l:_ : ''
        endif
    catch
    endtry
    return ''
endfunction

" MyFilename
function! MyFilename()
    if winwidth(0) < 120
        return ''
    else
        return ('' != MyReadonly() ? MyReadonly() . '' : '') .
                    \	 (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                    \		&ft == 'unite' ? unite#get_status_string() :
                    \		&ft == 'vimshell' ? vimshell#get_status_string() :
                    \		'' != expand('%:t') ? expand('%:t') : '[No Name]') .
                    \	 ('' != MyModified() ? '' . MyModified() : '')
    endif
endfunction

" MyReadonly
function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\uF23E " : ''
endfunction

" MyModified
function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? " \uF040" : &modifiable ? '' : '-'
endfunction

" MyGitGutter
let g:gitgutter_sign_added = "\uF067"
let g:gitgutter_sign_modified = "\uF061"
let g:gitgutter_sign_removed = "\uF00D"
function! MyGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
                \ || ! get(g:, 'gitgutter_enabled', 0)
                \ || winwidth('.') <= 50
        return ''
    endif
    let l:symbols = [
                \ g:gitgutter_sign_added . ' ',
                \ g:gitgutter_sign_modified . ' ',
                \ g:gitgutter_sign_removed . ' '
                \ ]
    let l:hunks = g:GitGutterGetHunkSummary()
    let l:ret = []
    for l:i in [0, 1, 2]
        if l:hunks[l:i] > 0
            call add(l:ret, l:symbols[l:i] . l:hunks[l:i])
        endif
    endfor
    return join(l:ret, ' ')
endfunction

" MyAnzu
function! MyAnzu()
    return ('' != anzu#search_status() ? '' . anzu#search_status() : '')
endfunction

" right
" MyCoc
function! MyCoc()
    return winwidth(0) > 100 ? coc#status() : ''
endfunction

" MyCharCode
function! MyCharCode()
    if winwidth('.') <= 120
        return ''
    endif
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
endfunction

" MyFileformat
function! MyFileformat()
    return winwidth(0) > 120 ? &fileformat . 
                \	 (exists('*WebDevIconsGetFileFormatSymbol()') ? ' ' . 
                \		WebDevIconsGetFileFormatSymbol() : '') : ''
endfunction

" MyFiletype
function! MyFiletype()
    return winwidth(0) > 120 ? (strlen(&filetype) ? &filetype . 
                \	 (exists('*WebDevIconsGetFileTypeSymbol()') ? ' ' . 
                \		WebDevIconsGetFileTypeSymbol() : '') : 'no ft') : ''
endfunction

" MyFileencoding
function! MyFileencoding()
    return winwidth(0) > 120 ? (strlen(&fenc) ? &fenc . '' : &enc) : ''
endfunction

" ale
function! s:ale_string(mode)
    if !exists('g:ale_buffer_info')
        return ''
    endif

    let l:buffer = bufnr('%')
    let l:counts = ale#statusline#Count(l:buffer)
    let [l:error_format, l:warning_format, l:no_errors] = g:ale_statusline_format

    if a:mode == 0 " Error
        let l:errors = l:counts.error + l:counts.style_error
        return l:errors ? printf(l:error_format . ' %d', l:errors) : ''
    elseif a:mode == 1 " Warning
        let l:warnings = l:counts.warning + l:counts.style_warning
        return l:warnings ? printf(l:warning_format . ' %d', l:warnings) : ''
    endif

    return l:counts.total ? '' : l:no_errors
endfunction

" MyAleFunc
function! MyAleError()
    return winwidth(0) > 70 ? s:ale_string(0) : ''
endfunction

function! MyAleWarning()
    return winwidth(0) > 70 ? s:ale_string(1) : ''
endfunction

function! MyAleOk()
    return winwidth(0) > 70 ? s:ale_string(2) : ''
endfunction

autocmd MyAutoCmd User ALELintPost call lightline#update()
