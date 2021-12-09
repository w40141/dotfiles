" 基本設定

" MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup end

lua << EOF
local set = vim.opt
-- 文字コード
set.encoding = 'utf-8'
set.fileformats = 'unix,dos,mac'
set.fileencodings='utf-8,sjis'
-- 256色設定にする
if vim.fn.has('gui_running') == false then
    set.t_Co = 256
end
-- 全モードでマウスを有効化
set.mouse = 'a'
-- 変更中のファイルでも、保存しないで他のファイルを表示する
set.hidden = true
-- スペルチェック
set.spell = false
-- 内容が変更されたら自動的に再読み込み
set.autoread = true
-- クリップボードをWindowsと連携する
set.clipboard = 'unnamed,unnamedplus'
-- ビープ音すべてを無効にする
set.visualbell = true
set.errorbells = false
-- 自動更新の時間
set.updatetime = 200
-- 不要なデフォルトプラグイン
local g = vim.g
g.did_indent_on             = 1
g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.did_load_filetypes        = 1
g.loaded_2html_plugin       = 1
g.loaded_gzip               = 1
g.loaded_getscript          = 1
g.loaded_getscriptPlugin    = 1
g.loaded_man                = 1
g.loaded_matchit            = 1
g.loaded_matchparen         = 1
g.loaded_netrw              = 1
g.loaded_netrwFileHandlers  = 1
g.loaded_netrwPlugin        = 1
g.loaded_netrwSettings      = 1
g.loaded_rrhelper           = 1
g.loaded_shada_plugin       = 1
g.loaded_spellfile_plugin   = 1
g.loaded_tar                = 1
g.loaded_tarPlugin          = 1
g.loaded_tutor_mode_plugin  = 1
g.loaded_vimball            = 1
g.loaded_vimballPlugin      = 1
g.loaded_zip                = 1
g.loaded_zipPlugin          = 1
g.skip_loading_mswin        = 1
EOF
