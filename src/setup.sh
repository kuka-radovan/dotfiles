#!/bin/bash

declare -r GITHUB_REPOSITORY="kuka-radovan/dotfiles"

declare -r DOTFILES_RELEASE_BRANCH="ver-2"
declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/$DOTFILES_RELEASE_BRANCH"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/$DOTFILES_RELEASE_BRANCH/src/utils/general.sh"

declare dotfilesDirectory="$HOME/workspace/dotfiles"

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

download() {
    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then
        curl \
            --location \
            --silent \
            --show-error \
            --output "$output" \
            "$url" \
                &> /dev/null

        return $?
    fi

    return 1
}

download_dotfiles() {
    local tmpFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_purple "\n • Download and extract archive\n\n"

    tmpFile="$(mktemp /tmp/dotfiles-archive)"

    download "$DOTFILES_TARBALL_URL" "$tmpFile"
    print_result $? "Download archive" "true"
    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_for_confirmation "Do you want to store the dotfiles in '$dotfilesDirectory'?"

    if ! answer_is_yes; then
        dotfilesDirectory=""
        while [ -z "$dotfilesDirectory" ]; do
            ask "Please specify another location for the dotfiles (path): "
            dotfilesDirectory="$(get_answer)"
        done
    fi

    # Ensure the `dotfiles` directory is available

    while [ -e "$dotfilesDirectory" ]; do
        ask_for_confirmation "'$dotfilesDirectory' already exists, do you want to overwrite it?"
        if answer_is_yes; then
            rm -rf "$dotfilesDirectory"
            break
        else
            dotfilesDirectory=""
            while [ -z "$dotfilesDirectory" ]; do
                ask "Please specify another location for the dotfiles (path): "
                dotfilesDirectory="$(get_answer)"
            done
        fi
    done

    printf "\n"

    mkdir -p "$dotfilesDirectory"
    print_result $? "Create '$dotfilesDirectory'" "true"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Extract archive in the `dotfiles` directory.

    extract "$tmpFile" "$dotfilesDirectory"
    print_result $? "Extract archive" "true"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Remove archive.

    rm -rf "$tmpFile"
    print_result $? "Remove archive"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    cd "$dotfilesDirectory/src" || return 1

}

download_utils() {
    local tmpFile=""

    tmpFile="$(mktemp /tmp/dotfiles_utils)"

    download "$DOTFILES_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0

   return 1
}

extract() {
    local archive="$1"
    local outputDir="$2"

    if command -v "tar" &> /dev/null; then

       tar \
            --extract \
            --gzip \
            --file "$archive" \
            --strip-components 1 \
            --directory "$outputDir"

        return $?
    fi

    return 1
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    printf '\n\n'
    echo '  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗'
    echo '  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝'
    echo '  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗'
    echo '  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║'
    echo '  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║'
    echo '  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝'
    printf '\n'

    # Ensure that the following actions are made relative to setup file path.

    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Load utils

    if [ -x "./utils/general.sh" ]; then
        . "./utils/general.sh" || exit 1
    else
        download_utils || exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_for_sudo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Check if this script is running directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.

    printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
        || download_dotfiles

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if cmd_exists "git"; then
        if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then
            ./initialize_git_repository.sh "$DOTFILES_ORIGIN"
        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./restart.sh
}

main "$@"
