#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Programming\n\n"

brew_install "Node" "node"
brew_install "Tree directory listing tool" "tree"
brew_install "Docker" "docker" "homebrew/cask" "cask"
brew_install "JSON" "quicklook-json" "homebrew/cask" "cask"
brew_install "Markdown" "qlmarkdown" "homebrew/cask" "cask"
brew_install "ImageOptim" "imageoptim" "homebrew/cask" "cask"
brew_install "ImageMagick" "imagemagick"
brew_install "TablePlus" "tableplus" "homebrew/cask" "cask"
brew_install "Postman" "postman" "homebrew/cask" "cask"
