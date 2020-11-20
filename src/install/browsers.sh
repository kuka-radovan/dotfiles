#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n\n"

brew_install "Brawe" "brave-browser" "homebrew/cask" "cask"
brew_install "Chrome" "google-chrome" "homebrew/cask" "cask"
brew_install "Firefox" "firefox" "homebrew/cask" "cask"
