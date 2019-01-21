# if [ -d $ZDOTDIR/extra_git/completions ]; then
#
# 	fpath=($ZDOTDIR/extra_git/completions/src(N-/) ${fpath})
# fi
#
# fpath = ($ZDOTDIR/extra_git/completions/src(N-/) ${fpath})

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -C

autoload -Uz colors
colors

# emaceのキーバインド
bindkey -e

export TERM=xterm-256color

export XDG_CACHE_HOME=$HOME/.cache
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG
export XDG_CONFIG_HOME=$HOME/.config
export NVM_DIR="$HOME/.nvm"
  # . "/usr/local/opt/nvm/nvm.sh"

# 補完 {{{

# 補完オプション# {{{
# 'cd' なしで移動する
setopt auto_cd

# cdの履歴を表示
# cd -<tab>
setopt auto_pushd

# 同ディレクトリを履歴に追加しない
setopt pushd_ignore_dups

# 補完キー連打で順に補完候補を自動的に補完
setopt auto_menu

# 補完候補を一覧で表示
setopt auto_list

# ディレクトリ名の補完で末尾の/を自動的に付加する
setopt auto_param_slash

# ファイル名の展開でディレクトリにマッチした場合末尾に/を付加
setopt mark_dirs

# カッコの対応など自動的に補完
setopt auto_param_keys

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# aliasを補完する
setopt complete_aliases

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

# =command を command のパス名に展開する
setopt equals

# --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

# 補完候補を詰めて表示
setopt list_packed

# 明確なドットの指定なしで.から始まるファイルを補完候補に上げる
setopt globdots

# 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt extended_glob

# スペルチェック
setopt correct
setopt correct_all

# 大小文字を区別しないで補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
# }}}

# 補完表示強化# {{{
# セパレータを設定する
zstyle ':completion:*' list-separator '-->'

# cdは親ディレクトリからカレントディレクトリを選択しないので表示させないようにする
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# 補完関数の色付け
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{yellow}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{red}No matches for:''%F{yellow} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*:corrections' format '%F{yellow}%B%d''%F{red}(errors: %e)%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:manuals' separate-sections true

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# 補完候補をハイライトする
zstyle ':completion:*:default' menu select=2

# }}}

# }}}

# History関連 {{{
# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=500

setopt EXTENDED_HISTORY

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
# setopt hist_expand

# }}}

# ターミナルのタイトルをカレントディレクトリにする {{{
case "${TERM}" in
    kterm*|xterm*)
        precmd() {
			echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1}'| rev)\007"
        }
        ;;
esac
# }}}

# その他{{{
# 日本語ファイル名等8ビットを通す
setopt print_eight_bit

# ビープを鳴らさない
setopt nobeep

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt notify

# 時間のかかる処理が終わったら通知する
REPORTTIME=2

# WORDCHARSで単語の区切りにならない文字を指定
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# kill# {{{
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single
# }}}

# }}}

# load .zshrc_* {{{
[ -f $ZDOTDIR/.zshrc_mac    ] && . $ZDOTDIR/.zshrc_mac
[ -f $ZDOTDIR/.zshrc_prompt ] && . $ZDOTDIR/.zshrc_prompt
[ -f $ZDOTDIR/.zshrc_alikey ] && . $ZDOTDIR/.zshrc_alikey
# [ -f $ZDOTDIR/.zshrc_linux  ] && . $ZDOTDIR/.zshrc_linux
[ -f $ZDOTDIR/.zshrc_exter  ] && . $ZDOTDIR/.zshrc_exter
[ -f $ZDOTDIR/.zshrc_mics   ] && . $ZDOTDIR/.zshrc_mics
[ -f $ZDOTDIR/.zshrc_local  ] && . $ZDOTDIR/.zshrc_local
# }}}

# cdをしたときにlsする
function chpwd() {la}

# プロファイル
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
