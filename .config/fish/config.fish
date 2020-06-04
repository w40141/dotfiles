set -gx XDG_CONFIG_HOME $HOME/.config
set -gx NVIM_PYTHON_LOG_FILE /tmp/nvim.log

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

alias la='ls -a'
alias ll='ls -l'
alias lal='la -l'
alias grep='grep --color'
alias cx 'chmod +x'

functions --copy cd standard_cd

function cd
    standard_cd $argv; and la
end

alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

alias po='poetry run'
alias pp='poetry run python'

function brew
    set -xl PATH $PATH # Protect global PATH by local PATH
    if type -q pyenv; and contains (pyenv root)/shims $PATH
        set -e PATH[(contains -i (pyenv root)/shims $PATH)]
    end

    command brew $argv
end

alias bud='brew update && brew upgrade && brew cask upgrade && brew doctor'
alias bbc="brew bundle --global --force cleanup"
alias bbd="brew bundle --global --force dump"
alias bbi="brew bundle --global --force install"

# peco
set -x fish_plugins theme peco

function fish_user_key_bindings
    bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

# theme-bobthefish
set -g theme_color_scheme solarized-dark
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
# set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
# set -g theme_display_docker_machine no
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_ruby no
set -g theme_display_user yes
# set -g theme_display_vi no
# set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
# set -g theme_title_use_abbreviated_path no
# set -g theme_date_format "+%a %H:%M"
# set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status no
set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt (set_color green)\uf0a9'  '

# set -gx SDKROOT (xcrun --sdk macosx --show-sdk-path)

# PATH
# set -x RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@1.1)
set -gx PYENV_ROOT $HOME/.pyenv

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)

register-python-argcomplete --shell fish pipx | .
set -g fish_user_paths $HOME/.local/bin $fish_user_paths
