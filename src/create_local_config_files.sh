#!/bin/zsh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils/general.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_gitconfig_local() {
    declare -r FILE_PATH="$HOME/.gitconfig.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        printf "%s\n" \
"[commit]
    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/
    # gpgsign = true
[user]
    name =
    email =
    # signingkey =" \
        >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"
}

create_vimrc_local() {

    declare -r FILE_PATH="$HOME/.vimrc.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then
        printf "" >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    print_in_purple "\n • Create local config files\n\n"

    create_gitconfig_local
    create_vimrc_local
}

main
