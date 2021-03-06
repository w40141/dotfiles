# for ls
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
abbr -a grep 'grep --color'

# for du
# for top
# for tldr
# for jq
# for fd
# for od
# for find
# for cat
# for procs
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
