#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Close any open `System Preferences` panes in order to
# avoid overriding the preferences that are being changed.

./close_system_preferences_panes.applescript

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • System preferences\n\n"

./app_store.sh
./chrome.sh
./dock.sh
./finder.sh
./keyboard.sh
./language_and_region.sh
./safari.sh
./terminal.sh
./textedit.sh
./trackpad.sh
./ui_and_ux.sh
