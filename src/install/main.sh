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
./programming.sh
./npm.sh
./terminal.sh
./vscode.sh
./apps.sh
