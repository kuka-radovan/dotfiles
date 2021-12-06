#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Safari\n\n"

execute "defaults write bluetoothaudiod 'Enable AptX codec' -bool true && \
         sudo defaults write bluetoothaudiod 'Enable AAC codec' -bool false" \
    "Enable better bluetooth sound quality codec'"
