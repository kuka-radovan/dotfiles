#!/bin/zsh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "general.sh"

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    print_in_purple "\n • Restart\n\n"

    ask_for_confirmation "Do you want to restart?"
    printf "\n"

    if answer_is_yes; then
        sudo shutdown -r now &> /dev/null
    fi
 }

 main
