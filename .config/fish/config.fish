set -x XDG_CONFIG_HOME $HOME/.config

alias la='ls -a'
alias ll='ls -l'
alias lal='la -l'

functions --copy cd standard_cd

function cd
	standard_cd $argv; and la
end
