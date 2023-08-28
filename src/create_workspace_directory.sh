#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils/general.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {
    declare -a DIRECTORIES=(
        "$HOME/Workspace"
    )

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    print_in_purple "\n • Create workspace directory\n\n"
    create_directories
}

main
