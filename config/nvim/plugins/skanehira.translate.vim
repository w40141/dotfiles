" Translate Language
" https://github.com/skanehira/translate.vim

UsePlugin 'translate.vim'

let g:translate_source = "en"
let g:translate_target = "ja"
let g:translate_popup_window = 1 " if you want use popup window, set value 1
let g:translate_winsize = 10 " set buffer window height size if you doesn't use popup window
nmap ,t <plug>(Translate)
vmap ,t <plug>(VTranslate)
