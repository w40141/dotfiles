set -gx XDG_CONFIG_HOME $HOME/.config

set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx NVIM_PYTHON_LOG_FILE /tmp/nvim.log

# if not functions -q fisher
#   curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
#   # curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
#   fish -c fisher
# end

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

# for fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
set -g GHQ_SELECTOR fzf
set -g GHQ_SELECTOR_OPTS "--no-sort --reverse --ansi --color bg+:13,hl:3,pointer:7"

function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
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

# for asdf
# source (brew --prefix asdf)"/asdf.fish"
# for pipx
# set PATH $PATH /Users/daisuke.oku/.local/bin

# set -U fish_user_paths /usr/local/sbin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/openssl@1.1/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/apr/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/curl/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/curl-openssl/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/icu4c/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/icu4c/sbin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/libpq/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/llvm/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/nss/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/openssl/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/qt/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/sqlite/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/libxml2/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/krb5/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/krb5/sbin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/sphinx-doc/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/openldap/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/openldap/sbin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/openjdk/bin $fish_user_paths
# set -U fish_user_paths /usr/local/opt/gnu-getopt/bin $fish_user_paths

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
fish_add_path /usr/local/opt/openjdk/bin
fish_add_path /usr/local/opt/gnu-getopt/bin
fish_add_path $HOME/.asdf/installs/poetry/1.1.6/bin
fish_add_path /usr/local/opt/libxslt/bin
