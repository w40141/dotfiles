" dein settings
if has('nvim')
	let g:python3_host_prog = $XDG_CONFIG_HOME.'/nvim/neovim3/.venv/bin/python'
endif

" dein自体の自動インストール
let s:cache_home		= empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_dir			= s:cache_home . '/dein'
let s:dein_repo_dir	= s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
	call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:rc_dic			= expand('~/.config/nvim/toml')
let s:toml				= s:rc_dic . '/dein.toml'
let s:toml_lazy		= s:rc_dic . '/dein_lazy.toml'
" プラグイン読み込み＆キャッシュ作成
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml,       {'lazy':0})
	call dein#load_toml(s:toml_lazy,  {'lazy':1})
	call dein#end()
	call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax on
