" 基本設定

" 文字コード
set encoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
" 256色設定にする
if !has('gui_running')
	set t_Co=256
endif
" MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup end
" 全モードでマウスを有効化
set mouse=a
" 変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
" スペルチェック
" set spelllang=en,cjk
set nospell
" 内容が変更されたら自動的に再読み込み
set autoread
" クリップボードをWindowsと連携する
set clipboard=unnamed,unnamedplus
" ビープ音すべてを無効にする
set visualbell
" set t_vb=
set noerrorbells
" 自動更新の時間
set updatetime=200

" 不要なデフォルトプラグイン
let g:did_indent_on             = 1
let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:did_load_filetypes        = 1
let g:loaded_2html_plugin       = 1
let g:loaded_gzip               = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrw              = 1
let g:loaded_netrwFileHandlers  = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_rrhelper           = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:skip_loading_mswin        = 1