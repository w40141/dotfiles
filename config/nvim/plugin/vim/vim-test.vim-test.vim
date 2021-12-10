" Run your tests at the speed of thought
" https://github.com/vim-test/vim-test

UsePlugin 'vim-test'

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let g:test#strategy = 'neoterm'
let g:test#preserve_screen = 1
let g:test#python#runner = 'pytest'
let g:test#java#runner = 'gradletest'
let g:test#go#runner = 'ginkgo'
" Runners available are 'gotest', 'ginkgo', 'richgo', 'delve'


