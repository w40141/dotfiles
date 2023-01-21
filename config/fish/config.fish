set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx NVIM_PYTHON_LOG_FILE /tmp/nvim.log

set -gx ASDF_CONFIG_FILE $XDG_CONFIG_HOME/asdf/.asdfrc

set -gx EDITOR nvim
set -x BROWSER open

# for fzf
set -x FZF_DEFAULT_OPTS '--border --color=fg+:10 --height 40% --reverse --select-1 --exit-0'
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*" 2> /dev/null'
# set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set -x FZF_COMPLETE 0
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
if command -s bat >/dev/null
    set -x FZF_PREVIEW_FILE_CMD "bat --color=always --style=numbers --line-range :500"
end
if command -s exa >/dev/null
    set -x FZF_PREVIEW_DIR_CMD exa
end
set -x FZF_ENABLE_OPEN_PREVIEW 1

function fzf_checkout_branch -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fzf_choose_branch -d "Use `fzf` to choose which branch to check out" --argument-names branch
    set -q branch[1]; or set branch ''
    git for-each-ref --format='%(refname:short)' refs/heads | fzf --height 10% --layout=reverse --border --query=$branch --select-1 | xargs git checkout
end

function fzf_checkout_commit -d "Fuzzy-find and checkout a commit"
    git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

function fzf_pick_branch -d "Pick desired files from a chosen branch"
    # use fzf to choose source branch to snag files FROM
    set branch (git for-each-ref --format='%(refname:short)' refs/heads | fzf --height 20% --layout=reverse --border)
    # avoid doing work if branch isn't set
    if test -n "$branch"
        # use fzf to choose files that differ from current branch
        set files (git diff --name-only $branch | fzf --height 20% --layout=reverse --border --multi)
    end
    # avoid checking out branch if files aren't specified
    if test -n "$files"
        git checkout $branch $files
    end
end

function fzf_view_all_unmerged -d "View all unmerged commits across all local branches"
    set viewUnmergedCommits "echo {} | head -1 | xargs -I BRANCH sh -c 'git log master..BRANCH --no-merges --color --format=\"%C(auto)%h - %C(green)%ad%Creset - %s\" --date=format:\'%b %d %Y\''"
    git branch --no-merged master --format "%(refname:short)" | fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$viewUnmergedCommits"
end

# Select a docker image or images to remove
function docker_select_image
    docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
end

# Select a docker container to start and attach to
function docker_start_container
    local cid
    cid (docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
end

# Select a running docker container to stop
function docker_stop_container
    local cid
    cid (docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker stop "$cid"
end

# Select a docker container to remove
function docker_remove_container
    local cid
    cid (docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker rm "$cid"
end

# Same as above, but allows multi selection:
function docker-remove-multi-container
    docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
end

function gh_create_and_ghq_get
    gh repo create $argv
    ghq get -p $argv[1]
end

set -g GHQ_SELECTOR fzf
set -g GHQ_SELECTOR_OPTS "--no-sort --reverse --ansi --color bg+:13,hl:3,pointer:7"
function ghq_fzf_repo -d 'Repository search'
    ghq list --full-path | fzf | read select
    [ -n "$select" ]; and cd "$select"
    echo " $select "
    commandline -f repaint
end

function fish_user_key_bindings
    bind \cg ghq_fzf_repo
end

# for develop
set -x GOPATH $HOME/dev
set -x PATH $PATH $GOPATH/bin

# theme-bobthefish
set -g theme_color_scheme dracula
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_cmd_duration no
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context no
set -g theme_display_k8s_namespace yes
set -g theme_display_hg no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_nvm no
set -g theme_display_virtualenv yes
set -g theme_title_display_process no
set -g theme_title_display_path yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status no
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt (set_color green)\uf0a9'  '

if test (uname) = Linux
    abbr -a bud 'brew update && brew upgrade && brew doctor && brew cleanup'
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
		fish_add_path $HOME/.local/bin
else
    abbr -a bud 'brew update && brew upgrade && brew upgrade --cask && brew doctor && brew cleanup'
    fish_add_path $HOME/.asdf/installs/poetry/1.3.2/bin
    if test (uname -m) = x86_64
        fish_add_path /usr/local/sbin
        fish_add_path /usr/local/opt/apr/bin
        fish_add_path /usr/local/opt/curl/bin
        fish_add_path /usr/local/opt/icu4c/bin
        fish_add_path /usr/local/opt/icu4c/sbin
        fish_add_path /usr/local/opt/libpq/bin
        # fish_add_path /usr/local/opt/llvm/bin
        fish_add_path /usr/local/opt/nss/bin
        fish_add_path /usr/local/opt/qt/bin
        fish_add_path /usr/local/opt/sqlite/bin
        fish_add_path /usr/local/opt/libxml2/bin
        fish_add_path /usr/local/opt/krb5/bin
        fish_add_path /usr/local/opt/krb5/sbin
        fish_add_path /usr/local/opt/sphinx-doc/bin
        fish_add_path /usr/local/opt/openldap/bin
        fish_add_path /usr/local/opt/openldap/sbin
        fish_add_path /usr/local/opt/gnu-getopt/bin
        fish_add_path /usr/local/opt/libxslt/bin
        fish_add_path /usr/local/opt/openssl@1.1/bin
        # fish_add_path /usr/local/opt/openssl@3/bin
        fish_add_path /usr/local/opt/ncurses/bin
        fish_add_path /usr/local/opt/mysql-client/bin
        fish_add_path $HOME/.local/bin

        source /usr/local/opt/asdf/libexec/asdf.fish
    else
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
        fish_add_path /opt/homebrew/opt/apr/bin
        fish_add_path /opt/homebrew/opt/curl/bin
        fish_add_path /opt/homebrew/opt/icu4c/bin
        fish_add_path /opt/homebrew/opt/icu4c/sbin
        fish_add_path /opt/homebrew/opt/libpq/bin
        # fish_add_path /opt/homebrew/opt/llvm/bin
        fish_add_path /opt/homebrew/opt/nss/bin
        fish_add_path /opt/homebrew/opt/qt/bin
        fish_add_path /opt/homebrew/opt/sqlite/bin
        fish_add_path /opt/homebrew/opt/libxml2/bin
        fish_add_path /opt/homebrew/opt/krb5/bin
        fish_add_path /opt/homebrew/opt/krb5/sbin
        fish_add_path /opt/homebrew/opt/sphinx-doc/bin
        fish_add_path /opt/homebrew/opt/openldap/bin
        fish_add_path /opt/homebrew/opt/openldap/sbin
        fish_add_path /opt/homebrew/opt/gnu-getopt/bin
        fish_add_path /opt/homebrew/opt/libxslt/bin
        fish_add_path /opt/homebrew/opt/openssl@1.1/bin
        # fish_add_path /opt/homebrew/opt/openssl@3/bin
        fish_add_path /opt/homebrew/opt/ncurses/bin
        fish_add_path /opt/homebrew/opt/mysql-client/bin
        fish_add_path $HOME/.local/bin

        source /opt/homebrew/opt/asdf/libexec/asdf.fish
    end
end

. ~/.asdf/plugins/java/set-java-home.fish

# zoxide init fish | source

# for ls or exa
if command -s exa >/dev/null
    abbr -a ls 'exa --icons'
    abbr -a la 'exa -a --icons'
    abbr -a ll 'exa -l --icons'
    abbr -a lal 'exa -al --icons'
else
    abbr -a la 'ls -a'
    abbr -a ll 'ls -l'
    abbr -a lal 'ls -al'
end

# for grep
if command -s rg >/dev/null
    abbr -a grep rg
else
    abbr -a grep 'grep --color'
end

# for find
if command -s fd >/dev/null
    abbr -a find fd
end

# for ghq
if command -s ghq >/dev/null
    abbr -a gg 'ghq get -p'
    abbr -a ghqg 'ghq get'
    abbr -a gc 'ghq create'
    abbr -a gau 'ghq list | ghq get --update --parallel'
end

abbr -a cx 'chmod +x'

abbr -a cd.. 'cd ..'
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'
abbr -a ..... 'cd ../../../..'

abbr -a po 'poetry run'
abbr -a pp 'poetry run python'

abbr -a abe 'for a in (abbr --list); abbr --erase $a; end'
abbr -a abs 'source ~/.config/fish/config_abbr.fish'

# for brew
abbr -a bci 'brew install --cask'
abbr -a bbc 'brew bundle --global --force cleanup'
abbr -a bbd 'brew bundle dump --global --force --describe'
abbr -a bbi 'brew bundle --global --force'

abbr -a echof 'echo $fish_user_paths | tr " " "\n" | nl'
abbr -a echop 'echo $PATH | tr " " "\n" | nl'

abbr -a ghci 'stack ghci'
abbr -a ghc 'stack ghc --'
abbr -a runghc 'stack runghc --'

abbr -a ghcr gh_create_and_ghq_get

functions --copy cd standard_cd

function cd
    standard_cd $argv; and exa -a --icons
    set -x p (pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)
    echo -ne '\033]0;$p\007'
end

function brew
    set -xl PATH $PATH # Protect global PATH by local PATH
    if type -q asdf; and contains $HOME/.asdf/shims $PATH
        set -e PATH[(contains -i $HOME/.asdf/shims $PATH)]
    end

    command brew $argv
end
