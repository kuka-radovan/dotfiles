#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Git\n\n"

brew_install "Git" "git"
brew_install "GitHub CLI" "github/gh/gh"
