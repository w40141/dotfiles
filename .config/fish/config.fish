set -gx XDG_CONFIG_HOME $HOME/.config
set -gx NVIM_PYTHON_LOG_FILE /tmp/nvim.log

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

functions --copy cd standard_cd

function cd
    standard_cd $argv; and exa -a --icons
    set -x p (pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)
    echo -ne '\033]0;$p\007'
end

function brew
    set -xl PATH $PATH # Protect global PATH by local PATH
    if type -q pyenv; and contains (pyenv root)/shims $PATH
        set -e PATH[(contains -i (pyenv root)/shims $PATH)]
    end

    command brew $argv
end

# for peco
set -x fish_plugins theme peco

function fish_user_key_bindings
    bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

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
set -g theme_display_ruby yes
set -g theme_display_nvm yes
set -g theme_display_virtualenv yes
set -g theme_title_display_process no
set -g theme_title_display_path yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status no
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt (set_color green)\uf0a9'  '

set -gx SDKROOT (xcrun --sdk macosx --show-sdk-path)

# PATH
set -gx PYENV_ROOT $HOME/.pyenv

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)

set -g fish_user_paths '/usr/local/sbin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/openssl@1.1/bin' $fish_user_paths
# set -g fish_user_paths '/usr/local/opt/ruby/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/apr/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/curl/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/curl-openssl/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/icu4c/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/icu4c/sbin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/libpq/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/llvm/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/nss/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/openssl/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/qt/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/sqlite/bin' $fish_user_paths
set -g fish_user_paths '$HOME/development/flutter/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/libxml2/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/krb5/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/krb5/sbin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/sphinx-doc/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/openldap/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/openldap/sbin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/openjdk/bin' $fish_user_paths
set -g fish_user_paths '/usr/local/opt/gnu-getopt/bin' $fish_user_paths
set -g fish_user_paths '$HOME/.poetry/bin' $fish_user_paths

set -g PATH $PATH /usr/local/opt/python@3.8/bin
# Created by `userpath` on 2020-07-21 01:25:03
set -g PATH $PATH $HOME/.local/bin
register-python-argcomplete --shell fish pipx | .
