# -------------------------------------
# 環境変数
# -------------------------------------

# {{{
# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
export EDITOR=/usr/local/bin/vim

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager
# }}}

# -------------------------------------
# zshのオプション
# -------------------------------------

# {{{
# 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# ビープを鳴らさない
setopt nobeep

# 色を使う
setopt prompt_subst

# ^Dでログアウトしない。
setopt ignoreeof

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# 履歴をインクリメンタルに追加
setopt inc_append_history

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# 補完候補を詰めて表示
setopt list_packed

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd
setopt autopushd

# 同じディレクトリは追加しない
setopt pushd_ignore_dups

# autojump.zsh
. /usr/local/etc/autojump.zsh

function precmd () {
    pwd=`pwd`
    echo "[^[[35m$pwd^[[m]"
    autojump -a $pwd
    echo $pwd > ~/.curdir
}

function exists { which $1 &> /dev/null }

# <C-r>でコマンド履歴検索
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

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

setopt EXTENDED_HISTORY

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴検索のショートカット
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 時間のかかる処理が終わったら通知する
REPORTTIME=2
# }}}

# -------------------------------------
# パス
# -------------------------------------

# {{{
# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

export PATH="/usr/local/bin:/usr/local/sbin:/usr:/usr/bin:./.pyenv/versions/2.7.6/lib/python2.7/site-packages:$PATH"

# path=(~/bin(N-/) /usr/local/bin(N-/) /usr/local/sbin(N-/) /usr/bin(N-/) ${path})
# }}}

# -------------------------------------
# 補完機能の強化
# -------------------------------------

# {{{
# if [ -e /usr/local/share/zsh-completions ]; then
#     fpath=(/usr/local/share/zsh-completions $fpath)
# fi

# fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -u
zstyle ':completion:*:default' menu select=2

# ファイル名の展開でディレクトリにマッチした場合末尾に/を付加
setopt mark_dirs

# 補完キー連打で順に補完候補を自動的に補完
setopt auto_menu

# ディレクトリ名の補完で末尾の/を自動的に付加する
setopt auto_param_slash

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# 大小文字を区別しないで補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey "^I" menu-complete

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 補完メッセージを読みやすくする
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# 名前で色を付けるようにする
autoload colors
colors

# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# }}}

# -------------------------------------
# プロンプト
# -------------------------------------

# {{{

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する {{{
setopt prompt_subst

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least
# }}}

# vcs_info 設定 {{{

RPROMPT=""

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors

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
if is-at-least 4.3.11; then
    # git のときはフック関数を設定する

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

    # フックの最初の関数
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
#
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

    # push していないコミットの件数表示
    #
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
#
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
nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

if [[ "$nomerged" -gt 0 ]] ; then
    # misc (%m) に追加
    hook_com[misc]+="(m${nomerged})"
fi
    }


    # stash 件数表示
    #
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

fi

function _update_vcs_info_msg() {
local -a messages
local prompt

LANG=en_US.UTF-8 vcs_info

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
add-zsh-hook precmd _update_vcs_info_msg
# }}}

# プロンプト指定 {{{
PROMPT="%{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(Φ ω Φ )ﾅﾆｶﾞｼﾀｲﾝｼﾞｬ?<!(＠￣￢￣%)ノ Aal Izz Well<)%{${reset_color}%} "

# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}ξ (・∀ ・)ξ %B%r%b %{$fg[red]%}ﾃﾞｽﾉ? [そう!(y), 違う!(n),a,e]:${reset_color} "
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
# キーバインド
# -------------------------------------

# {{{
bindkey -e

function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward
# }}}

# -------------------------------------
# その他
# -------------------------------------

# {{{
# cdしたあとで、自動的に ls する
function chpwd() { ls -a }

# ターミナルのタイトルをカレントディレクトリにする
case "${TERM}" in
    kterm*|xterm*)
        precmd() {
            echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
        }
        ;;
esac

export LSCOLORS=exfxcxdxbxegedabagacad

zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# .zshrc.mineファイルの内容を読み込む
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

# pyenv設定
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv設定
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

cd `cat ~/.curdir`

# }}}

