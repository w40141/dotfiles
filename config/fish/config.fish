set -gx XDG_CONFIG_HOME $HOME/.config

set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx NVIM_PYTHON_LOG_FILE /tmp/nvim.log

set -gx ASDF_CONFIG_FILE $XDG_CONFIG_HOME/asdf/.asdfrc

set -gx EDITOR nvim
set -gx BROWSER google-chrome

# for ls or exa
if command -s exa > /dev/null
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
abbr -a grep 'rg --color'

abbr -a cx 'chmod +x'

# for ghq
abbr -a gg 'ghq get -p'
abbr -a ggh 'ghq get'

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
abbr -a bud 'brew update && brew upgrade && brew upgrade --cask && brew doctor && brew cleanup'
abbr -a bci 'brew install --cask'
abbr -a bbc 'brew bundle --global --force cleanup'
abbr -a bbd 'brew bundle dump --global --force --describe'
abbr -a bbi 'brew bundle --global --force'

abbr -a echof 'echo $fish_user_paths | tr " " "\n" | nl'
abbr -a echop 'echo $PATH | tr " " "\n" | nl'

abbr -a ghci 'stack ghci'
abbr -a ghc 'stack ghc --'
abbr -a runghc 'stack runghc --'

functions --copy cd standard_cd

function cd_ls
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

# for fzf
set -x FZF_DEFAULT_OPTS '--color=fg+:10 --height 40% --reverse --select-1 --exit-0 --multi'
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_COMPLETE 1
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
if command -s bat > /dev/null
  # set -gx FZF_PREVIEW_FILE_CMD "bat --color=always --style=grid "
  set -x FZF_PREVIEW_FILE_CMD "bat --color=always --style=numbers --line-range :500"
end
set -x FZF_ENABLE_OPEN_PREVIEW 1

function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

function fzf-branch-checkout -d 'Checkout git branch'
  local branches branch
  branches (git --no-pager branch -vv) &&
  branch (echo "$branches" | fzf +m) &&
  git checkout (echo "$branch" | awk '{print $1}' | sed "s/.* //")
end

function fzf-branch-remote -d 'checkout git branch (including remote branches)'
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
end

# fshow - git commit browser
function fzf-commit-show -d 'git commit browser'
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
end

function fzf-checkout-branch -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fzf-choose-branch -d "Use `fzf` to choose which branch to check out" --argument-names branch
  set -q branch[1]; or set branch ''
  git for-each-ref --format='%(refname:short)' refs/heads | fzf --height 10% --layout=reverse --border --query=$branch --select-1 | xargs git checkout
end

function fzf-checkout-commit -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

function fzf-files-branch -d "Pick desired files from a chosen branch"
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

function fzf-view-all-unmerged -d "View all unmerged commits across all local branches"
  set viewUnmergedCommits "echo {} | head -1 | xargs -I BRANCH sh -c 'git log master..BRANCH --no-merges --color --format=\"%C(auto)%h - %C(green)%ad%Creset - %s\" --date=format:\'%b %d %Y\''"
  git branch --no-merged master --format "%(refname:short)" | fzf --no-sort --reverse --tiebreak=index --no-multi \
    --ansi --preview="$viewUnmergedCommits"
end

# # Select a docker image or images to remove
# function drmi() {
#   docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
# }
# 
# # Select a docker image or images to remove
# function drmi() {
#   docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
# }
# 
# # Select a docker container to start and attach to
# function da() {
#   local cid
#   cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')
# 
#   [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
# }
# 
# # Select a running docker container to stop
# function ds() {
#   local cid
#   cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')
# 
#   [ -n "$cid" ] && docker stop "$cid"
# }
# 
# # Select a docker container to remove
# function drm() {
#   local cid
#   cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')
# 
#   [ -n "$cid" ] && docker rm "$cid"
# }

# Same as above, but allows multi selection:
# function drm() {
#   docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
# }

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
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace no
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

fish_add_path /usr/local/sbin
fish_add_path /usr/local/opt/openssl@1.1/bin
fish_add_path /usr/local/opt/apr/bin
fish_add_path /usr/local/opt/curl/bin
fish_add_path /usr/local/opt/curl-openssl/bin
fish_add_path /usr/local/opt/icu4c/bin
fish_add_path /usr/local/opt/icu4c/sbin
fish_add_path /usr/local/opt/libpq/bin
fish_add_path /usr/local/opt/llvm/bin
fish_add_path /usr/local/opt/nss/bin
fish_add_path /usr/local/opt/openssl/bin
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
fish_add_path $HOME/.asdf/installs/poetry/1.1.7/bin

source /usr/local/opt/asdf/asdf.fish

# Created by `pipx` on 2021-07-29 07:31:47
set PATH $PATH /Users/daisuke_oku/.local/bin
