lua << EOF
local g = vim.g
require('init')
EOF

let g:loaded_perl_provider = 0
let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"
let g:node_host_prog = expand($HOME) . "/.asdf/installs/nodejs/16.9.1/.npm/bin/neovim-node-host"

let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction

autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

if empty(glob(s:plugvim))
    execute "!sh -c 'curl -fLo " .
        \ s:plugvim .
        \ " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
    autocmd MyAutoCmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
