" 基本設定

" MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup end

lua << EOF
-- 文字コード
vim.o.encoding = 'utf-8'
vim.o.fileformats = 'unix,dos,mac'
vim.o.fileencodings='utf-8,sjis'
-- 256色設定にする
if vim.fn.has('gui_running') == false then
    vim.o.t_Co = 256
end
-- 全モードでマウスを有効化
vim.o.mouse = 'a'
-- 変更中のファイルでも、保存しないで他のファイルを表示する
vim.o.hidden = true
-- スペルチェック
vim.o.spell = false
-- 内容が変更されたら自動的に再読み込み
vim.o.autoread = true
-- クリップボードをWindowsと連携する
vim.o.clipboard = 'unnamed,unnamedplus'
-- ビープ音すべてを無効にする
vim.o.visualbell = true
vim.o.errorbells = false
-- 自動更新の時間
vim.o.updatetime = 200
-- 不要なデフォルトプラグイン
vim.g.did_indent_on             = 1
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu   = 1
vim.g.did_load_filetypes        = 1
vim.g.loaded_2html_plugin       = 1
vim.g.loaded_gzip               = 1
vim.g.loaded_getscript          = 1
vim.g.loaded_getscriptPlugin    = 1
vim.g.loaded_man                = 1
vim.g.loaded_matchit            = 1
vim.g.loaded_matchparen         = 1
vim.g.loaded_netrw              = 1
vim.g.loaded_netrwFileHandlers  = 1
vim.g.loaded_netrwPlugin        = 1
vim.g.loaded_netrwSettings      = 1
vim.g.loaded_rrhelper           = 1
vim.g.loaded_shada_plugin       = 1
vim.g.loaded_spellfile_plugin   = 1
vim.g.loaded_tar                = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_tutor_mode_plugin  = 1
vim.g.loaded_vimball            = 1
vim.g.loaded_vimballPlugin      = 1
vim.g.loaded_zip                = 1
vim.g.loaded_zipPlugin          = 1
vim.g.skip_loading_mswin        = 1
EOF
