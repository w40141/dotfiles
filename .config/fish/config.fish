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
set -g PYENV_ROOT $HOME/.pyenv

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)

# Created by `userpath` on 2020-10-02 03:59:27
set PATH $PATH $HOME/.local/bin

register-python-argcomplete --shell fish pipx | source
