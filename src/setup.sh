#!/bin/bash

declare -r GITHUB_REPOSITORY="kuka-radovan/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/master"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/src/utils.sh"

declare dotfilesDirectory="/tmp/dotfiles"

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

download() {
    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then

        curl -LsSo "$output" "$url" &> /dev/null
        #     │││└─ write output to file
        #     ││└─ show error messages
        #     │└─ don't show the progress meter
        #     └─ follow redirects

        return $?
    fi

    return 1
}

download_dotfiles() {
    local tmpFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Download dotfiles to temp files.

    print_in_purple "\n • Download and extract archive\n\n"

    tmpFile="$(mktemp /tmp/dotfiles-archive)"

    download "$DOTFILES_TARBALL_URL" "$tmpFile"
    print_result $? "Download archive from github" "true"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Extract archive.

    mkdir -p "$dotfilesDirectory"

    extract "$tmpFile" "$dotfilesDirectory"
    print_result $? "Extract archive" "true"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Remove archive.
    rm -rf "$tmpFile"
    print_result $? "Remove archive from temp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    cd "$dotfilesDirectory/src" \
        || return 1
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
        tar -zxf "$archive" --strip-components 1 -C "$outputDir"
        return $?
    fi

    return 1
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    # Ensure that the following actions
    # are made relative to setup file path.

    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Load utils
    if [ -x "utils.sh" ]; then
        . "utils.sh" || exit 1
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
    ./preferences/main.sh
}

printf '\n\n'
echo '██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗'
echo '██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝'
echo '██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗'
echo '██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║'
echo '██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║'
echo '╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝'
printf '\n'

main "$@"
