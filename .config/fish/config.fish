set -x XDG_CONFIG_HOME $HOME/.config
. ~/.config/fish/env.fish
. ~/.config/fish/aliases.fish
. ~/.config/fish/Keybinds.fish
# cd & ls
functions --copy cd standard_cd

function cd
  standard_cd $argv; and ls -a
end

# # fzf
# # 一覧の上を最新として、境目をボーダーに
# set -x FZF_DEFAULT_OPTS "--reverse --border"
# # ディレクトリ検索で選択した項目の配下の構成をプレビューに表示する
# set -x FZF_ALT_C_OPTS   "--preview 'tree -C {} | head -200'"
# # ファイル検索で選択した項目の中身をプレビューに表示する
# set -x FZF_CTRL_T_OPTS  "--preview 'head -100 {}'"
#
# # エラーコードは番号で表示する
# set -g theme_show_exit_status yes
# # Gitのahead情報を細かく表示する
# set -g theme_display_git_ahead_verbose yes
set -g fish_user_paths "/usr/local/opt/tcl-tk/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl-openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
