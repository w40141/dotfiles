function __fish_is_subcommand
    test 1 -eq (count (string match -v -- '-*' (commandline -poc)))
end

complete -f -c pw -n '__fish_is_subcommand' -a register -d "register config"
complete -f -c pw -n '__fish_is_subcommand' -a generate -d "generate password from domain, user-id, length and symbol-flag"
complete -f -c pw -n '__fish_is_subcommand' -a show -d "show a password of domain"
complete -f -c pw -n '__fish_is_subcommand' -a show_all -d "show all passwords"
complete -f -c pw -n '__fish_is_subcommand' -a delete -d "delete a password"
complete -f -c pw -n '__fish_is_subcommand' -a delete_all -d "delete all passwords"
complete -f -c pw -n '__fish_is_subcommand' -a change -d "change a password"
