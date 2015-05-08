# -------------------------------------
# 環境変数
# -------------------------------------

# {{{
export LANG=jp_JP.UTF-8

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ for vim
export EDITOR=/usr/local/bin/vim

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

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

# path=(~/bin(N-/) /usr/local/bin(N-/) ${path})
path=(/usr/local/sbin(N-/) /usr/local/bin(N-/) /usr/bin(N-/) /bin(N-/) /usr/sbin(N-/) /sbin(N-/) /opt/X11/bin(N-/))
# }}}

# -------------------------------------
# 補完機能の強化
# -------------------------------------

# {{{
#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -u

autoload -Uz colors
colors

# 色設定ファイル {{{

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# 色定義{{{
# 属性
#  00:通常, 01:太字, 04:下線, 07:前/背景色の反転, 08:非表示
# 色
#  前景色
#   30:黒, 31:赤, 32:緑, 33:黄, 34:青, 35:紫, 36:シアン,
#   37:灰, 38:詳細指定(後述), 39:デフォルト
#  背景色
#   40:黒, 41:赤, 42:緑, 43:黄, 44:青, 45:紫, 46:シアン,
#   47:灰, 48:詳細指定(後述), 49:デフォルト
#
# 記述方法-------- その1 ---------
#  '\e[属性;前景色;背景色m'と'\e[m'で文字を囲む
# 例: 太字、赤字+青背景
#   echo '\e[1;31;44mここの色が変わる\e[m'
#
# 記述方法-------- その2 ---------
#  '\e[属性;38;5;詳細前景色コードm'と'\e[m'で文字を囲む
# 例:echo '\e[1;38;5;197mここの色が変わる\e[m'
#  同様に、48と詳細背景色コードで、背景色を指定できる
# 例: echo '\e[1;48;5;123mここの色が変わる\e[m'
#  同様に、前背景ともに詳細コードで指定できる
# 例: echo '\e[1;38;5;197;48;5;123mここの色が変わる\e[m'
#
# 詳細コードは、016から255までのRGB3桁で指定
# 一覧は以下の関数で表示可能

mycolSt='\e[0;'
mycolEd='\e[m'

typeset -A mycol
mycol=(
 'RED'      '38;5;161'
 'PINK'     '38;5;207'
 'BLUE'     '38;5;033'
 'ORANGE'   '38;5;208'
 'PURPLE'   '38;5;129'
 'GREEN'    '38;5;034'
 'YELLOW'   '38;5;247'
 'GLAY'     '38;5;238'
 'LGLAY'    '38;5;245' )

typeset -A mycolbg
mycolbg=(
 'RED'      '48;5;161'
 'PINK'     '48;5;207'
 'BLUE'     '48;5;033'
 'ORANGE'   '48;5;208'
 'PURPLE'   '48;5;129'
 'GREEN'    '48;5;034'
 'YELLOW'   '48;5;247'
 'GLAY'     '48;5;238'
 'LGLAY'    '48;5;245' )

# }}}

# LSCOLORSの指定 {{{
export LSCOLORS=exfxcxdxbxegedabagacad
# {{{
# 01:e ディレクトリ前景色
# 02:x ディレクトリ背景色
# 03:f シンボリックリンク前景色
# 04:x シンボリックリンク背景色
# 05:c ソケットファイル前景色
# 06:x ソケットファイル背景色
# 07:d FIFOファイル前景色
# 08:x FIFOファイル背景色
# 09:b 実行ファイル前景色
# 10:x 実行ファイル背景色
# 11:e ブロックスペシャルファイル前景色
# 12:g ブロックスペシャルファイル背景色
# 13:e キャラクタスペシャルファイル前景色
# 14:d キャラクタスペシャルファイル背景色
# 15:a setuidつき実行ファイル前景色
# 16:b setuidつき実行ファイル背景色
# 17:a setgidつき実行ファイル前景色
# 18:g setgidつき実行ファイル背景色
# 19:a スティッキビットありother書き込み権限つきディレクトリ前景色
# 20:c スティッキビットありother書き込み権限つきディレクトリ背景色
# 21:a スティッキビットなしother書き込み権限つきディレクトリ前景色
# 22:d スティッキビットなしother書き込み権限つきディレクトリ背景色
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
# }}}

# LS_COLORSの設定 {{{
export LS_COLORS=\
        'di=35:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
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
# }}}

# }}}

# zstyle {{{
# zstyle ':completion:*:*:コマンド:*:タグ' スタイル

# 大小文字を区別しないで補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
# zstyle ':completion:*:manuals' separate-sections true

# cdは親ディレクトリからカレントディレクトリを選択しないので表示させないようにする
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# 補完してほしくないファイルの指定
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# 補完候補を
zstyle ':completion:*:default' menu select=1

# 補完候補の色づけ
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

# 補完メッセージを読みやすくする
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{yellow}%d'$default
zstyle ':completion:*:warnings' format '%F{red}No matches for:''%F{yellow} %d'$default
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b'$default
zstyle ':completion:*:corrections' format '%F{yellow}%B%d''%F{red}(errors: %e)%b'$default
zstyle ':completion:*:options' description 'yes'

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# }}}

# オプション {{{
# ファイル名の展開でディレクトリにマッチした場合末尾に/を付加
setopt mark_dirs

# 補完キー連打で順に補完候補を自動的に補完
# setopt auto_menu

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

chpwd() {
    ls -Ga
}
# 訪問済みのディレクトリに戻る {{{
# cd -<NUM>
# dirs -vで表示
# DIRSTACKFILE="$HOME/.cache/zsh/dirs"
# if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
#     dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
#     [[ -d $dirstack[1] ]] && cd $dirstack[1]
# fi
# chpwd() {
#     ls -Ga && ${(u)dirstack} >$DIRSTACKFILE
# }

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
# manの補完をセクション番号別にする
zstyle ':completion:*:manuals' separate-sections true
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

# xport MANPAGER='less -R'
# man() {
#     env \
#         LESS_TERMCAP_mb=$(printf "\e[1;31m") \
#         LESS_TERMCAP_md=$(printf "\e[1;31m") \
#         LESS_TERMCAP_me=$(printf "\e[0m") \
#         LESS_TERMCAP_se=$(printf "\e[0m") \
#         LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#         LESS_TERMCAP_ue=$(printf "\e[0m") \
#         LESS_TERMCAP_us=$(printf "\e[1;32m") \
#         man "$@"
# }
# }}}

# }}}

# -------------------------------------
# プロンプト
# -------------------------------------

# {{{

# 右プロンプト(git)指定 {{{

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

if is-at-least 4.3.11; then #{{{
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

    function +vi-git-hook-begin() { #{{{
        # フックの最初の関数
        # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
        # (.git ディレクトリ内にいるときは呼び出さない)
        # .git ディレクトリ内では git status --porcelain などがエラーになるため
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi
        return 0
    } # }}}

    function +vi-git-untracked() { # {{{
        # untracked フィアル表示
        # untracked ファイル(バージョン管理されていないファイル)がある場合は
        # unstaged (%u) に ? を表示
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
    } # }}}

    function +vi-git-push-status() { #{{{
        # pushしていないコミットの件数表示
        # リモートリポジトリに push していないコミットの件数を
        # pN という形式で misc (%m) に表示する
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
    } # }}}

    function +vi-git-nomerge-branch() { #{{{
        # マージしていない件数表示
        # master 以外のブランチにいる場合に、
        # 現在のブランチ上でまだ master にマージしていないコミットの件数を
        # (mN) という形式で misc (%m) に表示
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
    } # }}}

    function +vi-git-stash-count() { #{{{
        # stash 件数表示
        # stash している場合は :SN という形式で misc (%m) に表示
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
    } # }}}

fi # }}}

function _update_vcs_info_msg() { #{{{
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
} # }}}

# hook関数
# precmd--プロンプトを表示する直前
# http://qiita.com/mollifier/items/558712f1a93ee07e22e2
add-zsh-hook precmd _update_vcs_info_msg

# }}}

# }}}

# 左プロンプト指定 {{{
# rootとその他で分ける
case "$UID" in
    # root
    0)
PROMPT="${fg[purple]}%~${reset_color}
%(?.$fg[yellow].$fg[green])%(?!ヾ(｡>﹏<｡)ﾉﾞ✧ *。ﾅﾆｶﾞｼﾀｲﾉ-? <! (๑¯Δ ¯๑%)/にゃんぱすー <)${reset_color} "
        ;;
    # その他
    *)
PROMPT="${fg[yellow]}%~${reset_color}
%(?.$fg[green].$fg[blue])%(?!ヾ(｡>﹏<｡)ﾉﾞ✧ *。ﾅﾆｶﾞｼﾀｲﾉ-? <! (๑¯Δ ¯๑%)/にゃんぱすー <)${reset_color} "
        ;;
esac

# 顔文字
# (*'-') (Φ ω Φ ) (＠￣￢￣%)ノ Aal Izz Well

# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# もしかしてのプロンプト指定
SPROMPT="${fg[red]}%{$suggest%}ξ (・∀ ・)ξ %B%r%b ${fg[red]}ﾃﾞｽﾉ? [そう!(y), 違う!(n),a,e]:${reset_color} "

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

# <C-r>でコマンド履歴検索 {{{
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
# alias ls="ls -G" # color for darwin
alias ls="gls --color"
alias l="ls -la"
alias la="ls -a"
alias l1="ls -1"


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

