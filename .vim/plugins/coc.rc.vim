"---------------------------------------------------------------------------
" coc.nvim
"

let g:coc_status_error_sign = "\uF490 "
let g:coc_status_warning_sign = "\uF4A3 "

" Use tab for trigger completion with characters ahead and navigate.  Use
" command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.

" Use <C-l> for trigger snippet expand.
imap <C-t> <Plug>(coc-snippets-expand)

" Use <C-s> for select text for visual placeholder of snippet.
vmap <C-s> <Plug>(coc-snippets-select)

" Use <C-g> for both expand and jump (make expand higher priority.)
imap <C-g> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
     \ pumvisible() ? coc#_select_confirm() :
     \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <TAB> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<TAB>'

" Use <S-TAB> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<S-TAB>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent><C-r> <Plug>(coc-range-select)
" xmap <silent><C-r> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent><Leader>d  :<C-u>CocList diagnostics<CR>
" Manage extensions
nnoremap <silent><Leader>e  :<C-u>CocList extensions<CR>
" Show commands
nnoremap <silent><Leader>c  :<C-u>CocList commands<CR>
" Find symbol of current document
nnoremap <silent><Leader>o  :<C-u>CocList outline<CR>
" Search workspace symbols
nnoremap <silent><Leader>s  :<C-u>CocList -I symbols<CR>
" Do default action for n
" ext item.
nnoremap <silent><Leader>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><Leader>p  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><Leader>r  :<C-u>CocListResume<CR>
