# ==========================================
# 基本設定（ターミナル制御・キーバインド）
# ==========================================
stty -ixon
bindkey -e
export WORDCHARS="${WORDCHARS//[\/.-]/}"

# ==========================================
# 環境変数・PATH設定
# ==========================================
typeset -U PATH

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export EDITOR="nvim"

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

if [[ "$(uname)" == "Linux" ]]; then
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
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INTERACTIVE_COMMENTS

zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# fzf-tab
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:kill:*' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'

zstyle ':fzf-tab:complete:docker:*' fzf-preview '
  case "$group" in
    subcommands) docker "$word" --help 2>/dev/null | sed -n "1,120p" ;;
    options)     docker --help 2>/dev/null | grep -E -- "$word" ;;
    *)           docker "$word" --help 2>/dev/null | sed -n "1,80p" ;;
  esac
'

# gitプレビュー
zstyle ':fzf-tab:complete:git:*' fzf-preview 'git diff --color=always $word 2>/dev/null'

# ==========================================
# ツールとプラグインの初期化
# ==========================================
eval "$(sheldon source)"
eval "$(starship init zsh)"
source <(fzf --zsh)

if command -v zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi
if command -v mise >/dev/null; then
    eval "$(mise activate zsh)"
fi
# ==========================================
# 展開されるエイリアス
# ==========================================
export ABBR_QUIET=1

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

abbr -f -S sed='sd' >/dev/null 2>&1
abbr -f -S rm='trash-put' >/dev/null 2>&1
abbr -f -S find='fd' >/dev/null 2>&1
abbr -f -S cd..='cd ..' >/dev/null 2>&1
abbr -f -S ..='cd ..' >/dev/null 2>&1
abbr -f -S ...='cd ../..' >/dev/null 2>&1
abbr -f -S ....='cd ../../..' >/dev/null 2>&1
abbr -f -S cx='chmod +x' >/dev/null 2>&1
abbr -f -S k='kubectl' >/dev/null 2>&1

if command -v ghq >/dev/null; then
    abbr -f -S gp='ghq get -p' >/dev/null 2>&1
    abbr -f -S gg='ghq get' >/dev/null 2>&1
    abbr -f -S gc='ghq create' >/dev/null 2>&1
    abbr -f -S gau='ghq list | ghq get --update --parallel' >/dev/null 2>&1
fi

abbr -f -S bci='brew install --cask' >/dev/null 2>&1
abbr -f -S bbc='brew bundle --global --force cleanup' >/dev/null 2>&1
abbr -f -S bbd='brew bundle dump --global --force' >/dev/null 2>&1
abbr -f -S bbi='brew bundle --global --force' >/dev/null 2>&1
abbr -f -S ghci='stack ghci' >/dev/null 2>&1
abbr -f -S ghc='stack ghc --' >/dev/null 2>&1
abbr -f -S runghc='stack runghc --' >/dev/null 2>&1

# ==========================================
# カスタム関数とキーバインド
# ==========================================
chpwd() {
    [[ $(command -v eza) ]] && eza -a --icons
    local p=$(pwd | awk -F/ '{print "/"$(NF-1)"/"$NF}')
    echo -ne "\033]0;$p\007"
}

gh_create_and_ghq_get() {
    gh repo create "$@"
    ghq get -p "$1"
}

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
bindkey '^g' ghq_fzf_repo

fzf_switch_branch() {
    local result=$(git branch --all | grep -v HEAD | tr -d ' ' | fzf)
    [[ -n "$result" ]] && git switch "$result"
    zle && zle reset-prompt
}
zle -N fzf_switch_branch
bindkey '^s' fzf_switch_branch

fzf_zoxide_cd() {
    local dir
    dir=$(zoxide query --list | fzf --height 40% --layout=reverse --prompt="Jump to> ")
    if [[ -n "$dir" ]]; then
        cd "$dir"
    fi
    zle && zle reset-prompt
}
zle -N fzf_zoxide_cd
bindkey '^q' fzf_zoxide_cd

fzf_choose_branch() {
    local branch="${1:-}"
    git for-each-ref --format='%(refname:short)' refs/heads | fzf --height 10% --layout=reverse --border --query="$branch" --select-1 | xargs -r git checkout
}

fzf_checkout_commit() {
    local result=$(git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1}')
    [[ -n "$result" ]] && git checkout "$result"
}

fzf_pick_branch() {
    local branch
    branch=$(git for-each-ref --format='%(refname:short)' refs/heads | fzf --height 20% --layout=reverse --border)
    if [[ -n "$branch" ]]; then
        local files=("${(@f)$(git diff --name-only "$branch" | fzf --height 20% --layout=reverse --border --multi)}")
        if [[ -n "${files[1]}" ]]; then
            git checkout "$branch" -- "${files[@]}"
        fi
    fi
}

fzf_view_all_unmerged() {
    local viewUnmergedCommits="echo {} | head -1 | xargs -I BRANCH sh -c 'git log master..BRANCH --no-merges --color --format=\"%C(auto)%h - %C(green)%ad%Creset - %s\" --date=format:\"%b %d %Y\"'"
    git branch --no-merged master --format "%(refname:short)" | fzf --no-sort --reverse --tiebreak=index --no-multi --ansi --preview="$viewUnmergedCommits"
}

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# ------------------------------------------
# git co <Tab> ラッパー
# ------------------------------------------
autoload -Uz _git

_git_custom_wrapper() {
    _git "$@"
    local ret=$?

    if [[ ("${words[2]}" == "co" || "${words[2]}" == "checkout") && $CURRENT -eq 3 ]]; then
        local -a files
        files=(${(f)"$(git status --porcelain 2>/dev/null | cut -c4-)"})

        if [[ -n ${files[1]} ]]; then
            compadd -V 'modified' -a files
            ret=0
        fi
    fi
    return ret
}

compdef _git_custom_wrapper git
