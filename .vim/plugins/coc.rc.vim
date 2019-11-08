"---------------------------------------------------------------------------
" coc.nvim
"

let g:coc_status_error_sign = "\uF490 "
let g:coc_status_warning_sign = "\uF4A3 "

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)

" Use K to show documentation in preview window
nmap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>fc  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent><Leader>rs <Plug>(coc-range-select)
xmap <silent><Leader>rs <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent><Leader>ld  :<C-u>CocList diagnostics<CR>
" Manage extensions
nnoremap <silent><Leader>le  :<C-u>CocList extensions<CR>
" Show commands
nnoremap <silent><Leader>lc  :<C-u>CocList commands<CR>
" Find symbol of current document
nnoremap <silent><Leader>lo  :<C-u>CocList outline<CR>
" Search workspace symbols
nnoremap <silent><Leader>ls  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent><Leader>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><Leader>p  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><Leader>lr  :<C-u>CocListResume<CR>
