#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Apps\n\n"

brew_install "Franz" "franz" "--cask"
brew_install "AppCleaner" "appcleaner" "--cask"
brew_install "Zoom" "zoomus" "--cask"
brew_install "Toggl track" "toggl-track" "--cask"
brew_install "VLC" "vlc" "--cask"
brew_install "Unarchiver" "the-unarchiver" "--cask"
brew_install "Spotify" "spotify" "--cask"
brew_install "Dropbox" "dropbox" "--cask"
brew_install "RecordIt" "recordit" "--cask"
brew_install "Zeplin" "zeplin" "--cask"
brew_install "Ruler" "free-ruler" "--cask"
brew_install "Evernote" "evernote" "--cask"
brew_install "XMind" "xmind" "--cask"
