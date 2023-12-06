#!/bin/zsh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils/general.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {
    declare -a FILES_TO_SYMLINK=(
        "config/shell/shell_aliases"
        "config/shell/shell_exports"
        "config/shell/shell_functions"
        "config/shell/shell_init"
        "config/shell/zlogout"
        "config/shell/shell_options"
        "config/shell/zprofile"
        "config/shell/shell_prompt"
        "config/shell/zshrc"
        "config/shell/curlrc"
        "config/shell/inputrc"

        "config/git/gitattributes"
        "config/git/gitconfig"
        "config/git/gitignore"

        "config/vim/vimrc"
    )

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [[ ! -e "$targetFile" ]]; then
            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [[ "$(readlink "$targetFile")" == "$sourceFile" ]]; then
            print_success "$targetFile → $sourceFile"
        else
            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"

            if answer_is_yes; then
                rm -rf "$targetFile"

                execute \
                    "ln -fs $sourceFile $targetFile" \
                    "$targetFile → $sourceFile"
            else
                print_error "$targetFile → $sourceFile"
            fi
        fi

    done
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
}

main "$@"
