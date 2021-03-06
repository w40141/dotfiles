" dein settings
if has('nvim')
  let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"
endif

" dein自体の自動インストール
let s:dein_dir = g:cache_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:rc_dir = g:config_dir . '/nvim/toml'
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml				= s:rc_dir . '/dein.toml'
  let s:toml_lazy		= s:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,       {'lazy':0})
  call dein#load_toml(s:toml_lazy,  {'lazy':1})
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
syntax on
