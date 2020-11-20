#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

./xcode.sh
./homebrew.sh
./bash.sh
./git.sh
./browsers.sh
./npm.sh
./programming.sh
./terminal.sh
./vscode.sh
./apps.sh
