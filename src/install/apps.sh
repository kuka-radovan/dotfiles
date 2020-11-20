#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Apps\n\n"

brew_install "Franz" "franz" "homebrew/cask" "cask"
brew_install "AppCleaner" "appcleaner" "homebrew/cask" "cask"
brew_install "Zoom" "zoomus" "homebrew/cask" "cask"
brew_install "Toggl track" "toggl-track" "homebrew/cask" "cask"
brew_install "VLC" "vlc" "homebrew/cask" "cask"
brew_install "Unarchiver" "the-unarchiver" "homebrew/cask" "cask"
brew_install "Spotify" "spotify" "homebrew/cask" "cask"
brew_install "Dropbox" "dropbox" "homebrew/cask" "cask"
brew_install "RecordIt" "recordit" "homebrew/cask" "cask"
brew_install "Zeplin" "zeplin" "homebrew/cask" "cask"
brew_install "Ruler" "free-ruler" "homebrew/cask" "cask"
brew_install "Evernote" "evernote" "homebrew/cask" "cask"
brew_install "XMind" "xmind" "homebrew/cask" "cask"
