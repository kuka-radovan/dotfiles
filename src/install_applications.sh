#!/bin/zsh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils/general.sh" \
    && . "utils/brew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_homebrew() {

    if ! cmd_exists "brew"; then
        ask_for_sudo
        printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    print_result $? "Homebrew"

}

set_homebrew_to_path() {

    if [[ "$(uname -m)" == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
}

install_homebrew_bundle() {

    brew_tap "homebrew/bundle"
    brew_install "Homebrew Bundle" "bundle"

}

install_apps_with_brewfile() {
    declare -r $DOTFILES_PATH="$(pwd)"

    execute "brew bundle install --file=$DOTFILES_PATH/installations/homebrew/Brewfile --verbose" "Install apps with Brewfile"
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    print_in_purple "\n   Homebrew\n\n"

    install_homebrew
    set_homebrew_to_path

    brew_disable_analytics
    brew_update
    brew_upgrade

    install_homebrew_bundle
    install_apps_with_brewfile
}

main
