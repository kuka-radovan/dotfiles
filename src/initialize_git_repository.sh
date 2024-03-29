#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils/general.sh"
    
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_git_repository() {
    git rev-parse &> /dev/null
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

initialize_git_repository() {
    declare -r GIT_ORIGIN="$1"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ -z "$GIT_ORIGIN" ]; then
        print_error "Please provide a URL for the Git origin"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! is_git_repository; then
        # Run the following Git commands in the root of the dotfiles directory.
        cd .. || print_error "Failed to move to dotfiles root directory"

        execute "git init && git remote add origin $GIT_ORIGIN" "Initialize the Git repository"
    fi
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    print_in_purple "\n • Initialize Git repository\n\n"
    initialize_git_repository "$1"
}

main "$1"
