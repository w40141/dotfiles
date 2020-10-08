function __fish_is_subcommand
    test 1 -eq (count (string match -v -- '-*' (commandline -poc)))
end

complete -f -c clitw -n '__fish_is_subcommand' -a tw -d "Tweet"
