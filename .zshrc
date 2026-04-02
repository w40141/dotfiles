# ==========================================
# 基本設定（ターミナル制御・キーバインド）
# ==========================================
# ターミナルの制御文字を無効化（Ctrl+S, Ctrl+Q がターミナルに吸い込まれるのを防ぐ）
stty -ixon

# Emacs風キーバインドを使用（Ctrl+Aで先頭、Ctrl+Eで末尾移動など）
bindkey -e
export WORDCHARS="${WORDCHARS//[\/.-]/}"

# ==========================================
# 環境変数・PATH設定
# ==========================================
# PATHの重複を自動的に防ぐ
typeset -U PATH

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export EDITOR="nvim"

# FZFの見た目や挙動の設定
export FZF_DEFAULT_OPTS='--border --color=fg+:10 --height 40% --reverse --select-1 --exit-0'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*" 2> /dev/null'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_FIND_FILE_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ENABLE_OPEN_PREVIEW=1
if command -v bat >/dev/null; then
    export FZF_PREVIEW_FILE_CMD="bat --color=always --style=numbers --line-range :500"
fi
if command -v eza >/dev/null; then
    export FZF_PREVIEW_DIR_CMD="eza"
fi

# OSごとのPATHとブラウザ設定
if [[ "$(uname)" == "Linux" ]]; then
    # eval は一旦削除し、手動で Homebrew の bin と sbin を PATH の先頭に追加します
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/home/linuxbrew/.linuxbrew/opt/mysql-client/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

    export BROWSER="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"
else
    export BROWSER="open"
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fi

# ==========================================
# 履歴・補完の挙動設定
# ==========================================
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY          # 履歴を上書きせず追記する
setopt SHARE_HISTORY           # 複数のターミナル間で履歴を即座に共有する
setopt HIST_IGNORE_ALL_DUPS    # 重複する古い履歴は削除する
setopt HIST_IGNORE_SPACE       # 先頭にスペースを入れて実行したコマンドは履歴に残さない
setopt HIST_REDUCE_BLANKS      # 履歴保存時に余分な空白を詰める
setopt INTERACTIVE_COMMENTS    # コマンドラインで '#' 以降をコメントとして扱えるようにする

# 補完メニューの挙動設定
zmodload zsh/complist
zstyle ':completion:*' menu select                      # 補完候補をTabや矢印キーで選択可能にする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'     # 大文字小文字を区別せずに補完する
# --- fzf-tab の拡張設定 ---
# 補完時のプレビュー画面を無効化（デフォルト）から有効化に変更
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# cdコマンドの補完時に、ezaを使ってディレクトリの中身をプレビュー表示する
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# killコマンドの補完時にプロセス一覧をプレビュー表示する
zstyle ':fzf-tab:complete:kill:*' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
# docker のサブコマンド補完時に help を下に表示
zstyle ':fzf-tab:complete:docker:*' fzf-preview '
  case "$group" in
    subcommands)
      docker "$word" --help 2>/dev/null | sed -n "1,120p"
      ;;
    options)
      docker --help 2>/dev/null | grep -E -- "$word"
      ;;
    *)
      docker "$word" --help 2>/dev/null | sed -n "1,80p"
      ;;
  esac
'

# ==========================================
# ツールとプラグインの初期化
# ==========================================
# プラグインマネージャー (Sheldon) の読み込み
eval "$(sheldon source)"

# プロンプト (Starship)
eval "$(starship init zsh)"

# fzf 公式のキーバインド (Ctrl+R, Ctrl+T, Alt+C) と補完
source <(fzf --zsh)

# ディレクトリ移動 (zoxide)
if command -v zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi

# 言語ランタイム管理 (mise)
if command -v mise >/dev/null; then
    eval "$(mise activate zsh)"
fi

# 履歴検索の強化 (Atuin)
if command -v atuin >/dev/null; then
    eval "$(atuin init zsh --disable-up-arrow)"
fi

# ==========================================
# 展開されるエイリアス（すべてabbrで可視化）
# ==========================================
# zsh-abbrの通知を静かにする
export ABBR_QUIET=1

# --- ls, grep 等の基本コマンド ---
# 既存のコマンドを上書きするため -f を付与し、警告を /dev/null に捨てます
if command -v eza >/dev/null; then
    abbr -f -S ls='eza --icons' >/dev/null 2>&1
    abbr -f -S la='eza -a --icons' >/dev/null 2>&1
    abbr -f -S ll='eza -l --icons' >/dev/null 2>&1
    abbr -f -S lal='eza -al --icons' >/dev/null 2>&1
    abbr -f -S tree='eza --tree --icons' >/dev/null 2>&1
else
    abbr -f -S la='ls -a' >/dev/null 2>&1
    abbr -f -S ll='ls -l' >/dev/null 2>&1
    abbr -f -S lal='ls -al' >/dev/null 2>&1
fi

if command -v bat >/dev/null; then
  abbr -f -S cat='bat ' >/dev/null 2>&1
fi

if command -v rg >/dev/null; then
    abbr -f -S grep='rg' >/dev/null 2>&1
else
    abbr -f -S grep='grep --color=auto' >/dev/null 2>&1
fi

if [[ "$(uname)" == "Linux" ]]; then
    abbr -f -S bud='brew update && brew upgrade && brew doctor && brew cleanup' >/dev/null 2>&1
else
    abbr -f -S bud='brew update && brew upgrade && brew upgrade --cask && brew doctor && brew cleanup' >/dev/null 2>&1
fi

# --- モダンCLIツールへの強制置き換え ---
abbr -f -S sed='sd' >/dev/null 2>&1
abbr -f -S rm='trash-put' >/dev/null 2>&1  # macOSの場合は 'trash'
abbr -f -S find='fd' >/dev/null 2>&1

# --- ディレクトリ移動 ---
abbr -f -S cd..='cd ..' >/dev/null 2>&1
abbr -f -S ..='cd ..' >/dev/null 2>&1
abbr -f -S ...='cd ../..' >/dev/null 2>&1
abbr -f -S ....='cd ../../..' >/dev/null 2>&1

# --- コマンド短縮 ---
abbr -f -S cx='chmod +x' >/dev/null 2>&1
abbr -f -S k='kubectl' >/dev/null 2>&1

# --- ghq関連 ---
if command -v ghq >/dev/null; then
    abbr -f -S gp='ghq get -p' >/dev/null 2>&1
    abbr -f -S gg='ghq get' >/dev/null 2>&1
    abbr -f -S gc='ghq create' >/dev/null 2>&1
    abbr -f -S gau='ghq list | ghq get --update --parallel' >/dev/null 2>&1
fi

# --- Homebrew関連 ---
abbr -f -S bci='brew install --cask' >/dev/null 2>&1
abbr -f -S bbc='brew bundle --global --force cleanup' >/dev/null 2>&1
abbr -f -S bbd='brew bundle dump --global --force' >/dev/null 2>&1
abbr -f -S bbi='brew bundle --global --force' >/dev/null 2>&1

# --- Haskell関連 ---
abbr -f -S ghci='stack ghci' >/dev/null 2>&1
abbr -f -S ghc='stack ghc --' >/dev/null 2>&1
abbr -f -S runghc='stack runghc --' >/dev/null 2>&1

# ==========================================
# カスタム関数とキーバインド
# ==========================================
# cd した直後に eza で中身を表示し、ターミナルのタイトルを更新
chpwd() {
    [[ $(command -v eza) ]] && eza -a --icons
    local p=$(pwd | awk -F/ '{print "/"$(NF-1)"/"$NF}')
    echo -ne "\033]0;$p\007"
}

gh_create_and_ghq_get() {
    gh repo create "$@"
    ghq get -p "$1"
}

# --- fzfを活用したカスタム関数群 ---
export GHQ_SELECTOR="fzf"
export GHQ_SELECTOR_OPTS="--no-sort --reverse --ansi --color bg+:13,hl:3,pointer:7"

ghq_fzf_repo() {
    local select=$(ghq list --full-path | fzf)
    if [[ -n "$select" ]]; then
        cd "$select"
        echo " $select "
    fi
    zle && zle reset-prompt
}
zle -N ghq_fzf_repo
bindkey '^g' ghq_fzf_repo # Ctrl+G で ghqリポジトリ検索

fzf_switch_branch() {
    local result=$(git branch --all | grep -v HEAD | tr -d ' ' | fzf)
    [[ -n "$result" ]] && git switch "$result"
    zle && zle reset-prompt
}
zle -N fzf_switch_branch
bindkey '^s' fzf_switch_branch # Ctrl+S で Gitブランチ切り替え

fzf_zoxide_cd() {
    local dir
    dir=$(zoxide query --list | fzf --height 40% --layout=reverse --prompt="Jump to> ")
    if [[ -n "$dir" ]]; then
        cd "$dir"
    fi
    zle && zle reset-prompt
}
zle -N fzf_zoxide_cd
bindkey '^q' fzf_zoxide_cd # Ctrl+Q で zoxide履歴からディレクトリ移動

# history-substring-search 用のキーバインド (Ctrl+P / Ctrl+N、および上下矢印キー)
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
