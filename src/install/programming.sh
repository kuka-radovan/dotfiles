#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Programming\n\n"

brew_install "Node" "node"
brew_install "Tree directory listing tool" "tree"
brew_install "Docker" "docker" "--cask"
brew_install "JSON" "quicklook-json" "--cask"
brew_install "Markdown" "qlmarkdown" "--cask"
brew_install "ImageOptim" "imageoptim" "--cask"
brew_install "ImageMagick" "imagemagick"
brew_install "TablePlus" "tableplus" "--cask"
brew_install "Postman" "postman" "--cask"
