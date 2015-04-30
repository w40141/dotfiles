# -------------------------------------
# 補完機能の強化
# -------------------------------------

# {{{
#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -u

# color# {{{
# 名前で色を付けるようにする
autoload -Uz colors
colors

# 色の定義 {{{
# local DEFAULT=$'%{^[[m%}'$
# local RED=$'%{^[[1;31m%}'$
# local GREEN=$'%{^[[1;32m%}'$
# local YELLOW=$'%{^[[1;33m%}'$
# local BLUE=$'%{^[[1;34m%}'$
# local PURPLE=$'%{^[[1;35m%}'$
# local LIGHT_BLUE=$'%{^[[1;36m%}'$
# local WHITE=$'%{^[[1;37m%}'$
local DEFAULT=$'%{e[m%}'$
local RED=$'%{e[1;31m%}'$
local GREEN=$'%{e[1;32m%}'$
local YELLOW=$'%{e[1;33m%}'$
local BLUE=$'%{e[1;34m%}'$
local PURPLE=$'%{e[1;35m%}'$
local LIGHT_BLUE=$'%{e[1;36m%}'$
local WHITE=$'%{e[1;37m%}'$
# }}}

# LSCOLORSの指定 {{{
# {{{
# 01: ディレクトリ前景色
# 02: ディレクトリ背景色
# 03: シンボリックリンク前景色
# 04: シンボリックリンク背景色
# 05: ソケットファイル前景色
# 06: ソケットファイル背景色
# 07: FIFOファイル前景色
# 08: FIFOファイル背景色
# 09: 実行ファイル前景色
# 10: 実行ファイル背景色
# 11: ブロックスペシャルファイル前景色
# 12: ブロックスペシャルファイル背景色
# 13: キャラクタスペシャルファイル前景色
# 14: キャラクタスペシャルファイル背景色
# 15: setuidつき実行ファイル前景色
# 16: setuidつき実行ファイル背景色
# 17: setgidつき実行ファイル前景色
# 18: setgidつき実行ファイル背景色
# 19: スティッキビットありother書き込み権限つきディレクトリ前景色
# 20: スティッキビットありother書き込み権限つきディレクトリ背景色
# 21: スティッキビットなしother書き込み権限つきディレクトリ前景色
# 22: スティッキビットなしother書き込み権限つきディレクトリ背景色
# a: 黒
# b: 赤
# c: 緑
# d: 茶
# e: 青
# f: マゼンタ
# g: シアン
# h: 白
# A: 黒(太字)
# B: 赤(太字)
# C: 緑(太字)
# D: 茶(太字)
# E: 青(太字)
# F: マゼンタ(太字)
# G: シアン(太字)
# H: 白(太字)
# x: デフォルト色
# }}}
export LSCOLORS=exfxcxdxbxegedabagacad
# }}}

# LS_COLORSの設定 {{{
# {{{
# di: ディレクトリ
# ln: シンボリックリンク
# so: ソケットファイル
# pi: FIFOファイル
# ex: 実行ファイル
# bd: ブロックスペシャルファイル
# cd: キャラクタスペシャルファイル
# su: setuidつき実行ファイル
# sg: setgidつき実行ファイル
# tw: スティッキビットありother書き込み権限つきディレクトリ
# ow: スティッキビットなしother書き込み権限つきディレクトリ
# 00: なにもしない
# 01: 太字化
# 04: 下線
# 05: 点滅
# 07: 前背色反転
# 08: 表示しない
# 22: ノーマル化
# 24: 下線なし
# 25: 点滅なし
# 27: 前背色反転なし
# 30: 黒(前景色)
# 31: 赤(前景色)
# 32: 緑(前景色)
# 33: 茶(前景色)
# 34: 青(前景色)
# 35: マゼンタ(前景色)
# 36: シアン(前景色)
# 37: 白(前景色)
# 39: デフォルト(前景色)
# 40: 黒(背景色)
# 41: 赤(背景色)
# 42: 緑(背景色)
# 43: 茶(背景色)
# 44: 青(背景色)
# 45: マゼンタ(背景色)
# 46: シアン(背景色)
# 47: 白(背景色)
# 49: デフォルト(背景色)
# }}}
export LS_COLORS=\
        'di=35:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# }}}

# }}}

# オプション {{{
# ファイル名の展開でディレクトリにマッチした場合末尾に/を付加
setopt mark_dirs

# 補完キー連打で順に補完候補を自動的に補完
setopt auto_menu

# 補完候補を一覧で表示
setopt auto_list

# ディレクトリ名の補完で末尾の/を自動的に付加する
setopt auto_param_slash

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# =command を command のパス名に展開する
setopt equals

# --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

# カッコの対応など自動的に補完
setopt auto_param_keys

# 補完候補を詰めて表示
setopt list_packed

# 補完候補にファイルの種類を表示
setopt list_types

# }}}

# zstyle {{{
# zstyle ':completion:*:*:コマンド:*:タグ' スタイル

# 大小文字を区別しないで補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# cdは親ディレクトリからカレントディレクトリを選択しないので表示させないようにする
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# 補完候補を
zstyle ':completion:*:default' menu select=2

# 補完候補の色づけ
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

# 補完メッセージを読みやすくする
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:warnings' format '%F{red}No matches for:''%F{yellow} %d'$default
zstyle ':completion:*:messages' format '%F{yellow}%d'$default
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b'$default
zstyle ':completion:*:corrections' format '%F{yellow}%B%d''%F{red}(errors: %e)%b'$default
zstyle ':completion:*:options' description 'yes'

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# }}}

# }}}

# -------------------------------------
# zshのオプション
# -------------------------------------

# {{{
# ビープを鳴らさない
setopt nobeep

# ^Dでログアウトしない。
setopt ignoreeof

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# cd関連 {{{

# 'cd' なしで移動する
setopt auto_cd

# 訪問済みのディレクトリに戻る {{{
# cd -<NUM>
# dirs -vで表示
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
    ls -Ga && ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

# 自動的にpushdする
setopt autopushd pushdsilent pushdtohome

# 同じディレクトリはpushdに追加しない
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus
# }}}
# }}}

# スペルチェック
setopt correct

# autojump.zsh {{{
# . /usr/local/bin/autojump
# function precmd () {
#     pwd=`pwd`
#     echo "[^[[35m$pwd^[[m]"
#     autojump -a $pwd
#     echo $pwd > ~/.curdir
# }
# }}}

# History関連 {{{
# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# }}}

# 時間のかかる処理が終わったら通知する
REPORTTIME=2

# WORDCHARSで単語の区切りにならない文字を指定
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# man {{{
export MANPAGER='less -R'
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;32m") \
        LESS_TERMCAP_me=$(printf "\e[1;33m") \
        LESS_TERMCAP_se=$(printf "\e[1;34m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;35m") \
        LESS_TERMCAP_ue=$(printf "\e[1;36m") \
        LESS_TERMCAP_us=$(printf "\e[1;37m") \
        man "$@"
}
# }}}

# }}}

# -------------------------------------
# プロンプト
# -------------------------------------

# {{{

# 右プロンプト(git)指定# {{{

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する {{{
setopt prompt_subst

autoload -U promptinit; promptinit
autoload -Uz vcs_info
autoload -Uz is-at-least
autoload -Uz add-zsh-hook
autoload -Uz is-at-least

# }}}

# vcs_info 設定 {{{
RPROMPT=""

# 以下の3つのメッセージをエクスポートする
#   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
#   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
#   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3

zstyle ':vcs_info:*' enable git svn hg bzr
# 標準のフォーマット(git 以外で使用)
# misc(%m) は通常は空文字列に置き換えられる
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
    zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u %m'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr "-"  # %u で表示する文字列
fi
# }}}

# hooks 設定 {{{

# git のときはフック関数を設定する {{{
if is-at-least 4.3.11; then
    # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    # のメッセージを設定する直前のフック関数
    # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
    # 各関数が最大3回呼び出される。
    zstyle ':vcs_info:git+set-message:*' hooks \
        git-hook-begin \
        git-untracked \
        git-push-status \
        git-nomerge-branch \
        git-stash-count

# フックの最初の関数 {{{
    # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
    # (.git ディレクトリ内にいるときは呼び出さない)
    # .git ディレクトリ内では git status --porcelain などがエラーになるため
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi

        return 0
        }
# }}}

# untracked フィアル表示 {{{
    # untracked ファイル(バージョン管理されていないファイル)がある場合は
    # unstaged (%u) に ? を表示
    function +vi-git-untracked() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then

            # unstaged (%u) に追加
            hook_com[unstaged]+='?'
        fi
    }
# }}}

# pushしていないコミットの件数表示 {{{
    # リモートリポジトリに push していないコミットの件数を
    # pN という形式で misc (%m) に表示する
    function +vi-git-push-status() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" != "master" ]]; then
            # master ブランチでない場合は何もしない
            return 0
        fi

        # push していないコミット数を取得する
        local ahead
        ahead=$(command git rev-list origin/master..master 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+="(p${ahead})"
        fi
    }
# }}}

# マージしていない件数表示 {{{
    # master 以外のブランチにいる場合に、
    # 現在のブランチ上でまだ master にマージしていないコミットの件数を
    # (mN) という形式で misc (%m) に表示
    function +vi-git-nomerge-branch() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" == "master" ]]; then
            # master ブランチの場合は何もしない
            return 0
        fi

        local nomerged
        nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$nomerged" -gt 0 ]] ; then
            # misc (%m) に追加
            hook_com[misc]+="(m${nomerged})"
        fi
    }
# }}}

# stash 件数表示 {{{
    # stash している場合は :SN という形式で misc (%m) に表示
    function +vi-git-stash-count() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+=":S${stash}"
        fi
    }
# }}}

fi
# }}}

# update_vcs_info_msg {{{
function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UtF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        prompt=""
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        # 間にスペースを入れて連結する
        prompt="${(j: :)messages}"
    fi

    RPROMPT="$prompt"
}
# }}}

add-zsh-hook precmd _update_vcs_info_msg

# }}}

# }}}

# 左プロンプト指定 {{{
# rootとその他で分ける
case "$UID" in
    0)
PROMPT="%{${fg[purple]}%}%~%{${reset_color}%}
%(?.%{$fg[yellow]%}.%{$fg[green]%})%(?!ヾ(｡>﹏<｡)ﾉﾞ✧ *。ﾅﾆｶﾞｼﾀｲﾉ-? <! (๑¯Δ ¯๑%)/にゃんぱすー <)%{${reset_color}%} "
        ;;
    *)
PROMPT="%{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!ヾ(｡>﹏<｡)ﾉﾞ✧ *。ﾅﾆｶﾞｼﾀｲﾉ-? <! (๑¯Δ ¯๑%)/にゃんぱすー <)%{${reset_color}%} "
        ;;
esac

# 顔文字
# (*'-') (Φ ω Φ ) (＠￣￢￣%)ノ Aal Izz Well

# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# もしかしてのプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}ξ (・∀ ・)ξ %B%r%b %{$fg[reb]%}ﾃﾞｽﾉ? [そう!(y), 違う!(n),a,e]:${reset_color} "

# }}}

# }}}

# -------------------------------------
# キーバインド
# -------------------------------------

# {{{

# emaceのキーバインド
bindkey -e

# 展開する前に補完候補を出させる(C-iで補完するようにする)
bindkey "^I" menu-complete

# <C-n>, <C-p>履歴から補完を行う {{{
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# }}}

# <C-^>上のディレクトリに移動する {{{
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '^\^' cdup
# }}}

# <C-r>でコマンド履歴検索# {{{
function exists { which $1 &> /dev/null }
if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(history -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi
# }}}

# <C-y>カーソルから左のスペースまでをkillする {{{
function _kill-backward-blank-word() {
    zle set-mark-command
    zle vi-backward-blank-word
    zle kill-region
}
zle -N _kill-backward-blank-word
bindkey '^Y' _kill-backward-blank-word
# }}}

# }}}

# -------------------------------------
# エイリアス
# -------------------------------------

# {{{

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

alias ...="cd ../.."
alias ....="cd ../../.."

# ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -a"
alias l1="ls -1"

alias gls="gls --color"

alias rm="rm -i"
alias rmd="rm -ir"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

alias szsh="source ~/.zshrc"

alias memo=""

# pyenvでbrew doctorした時にでるwarningsをなくす
alias brew="env PATH=${PATH/\/Users\/aisuke\/\.pyenv\/shims:?/} brew"

# }}}

# -------------------------------------
# その他
# -------------------------------------

# {{{

# ターミナルのタイトルをカレントディレクトリにする {{{
case "${TERM}" in
    kterm*|xterm*)
        precmd() {
            echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
        }
        ;;
esac
# }}}

# pyenv設定
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv設定
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

cd `cat ~/.curdir`

# }}}

