#!/bin/bash

declare -r GITHUB_REPOSITORY="kuka-radovan/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"

declare localDotfilesDirectory="$HOME/Workspace/dotfiles"


# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
  echo Installing dotfiles...
}

main "$@"