#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugin() {
    execute "hyper i $1" "$2 (plugin)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

# Install VSCode
brew_install "Hyper terminal" "hyper" "--cask"

printf "\n"

# Install hyper plugins
# install_plugin "hyper-statusline" "Status Line"
install_plugin "hyper-chesterish" "Chesterish Theme"
install_plugin "hypercwd" "HyperCwd"
install_plugin "hyperlinks" "Hyperlinks"
