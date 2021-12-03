#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils/general.sh" \
    && . "../utils/homebrew.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugin() {
    execute "code --install-extension $1" "$2 (plugin)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"                                :

# Install VSCode
brew_install "Visual Studio Code" "visual-studio-code" "--cask"

printf "\n"

# Install the VSCode plugins
install_plugin "Arjun.swagger-viewer" "Swagger viewer"
install_plugin "bierner.github-markdown-preview" "Github md preview"
install_plugin "bierner.markdown-preview-github-styles" "Github md preview styling"
install_plugin "bierner.markdown-checkbox" "Markdown checkboxes"
install_plugin "runem.lit-plugin" "Syntax highlighting of lit-html"
install_plugin "CoenraadS.bracket-pair-colorizer-2" "Bracket pair colorizer"
install_plugin "DavidAnson.vscode-markdownlint" "Markdown linter"
install_plugin "dbaeumer.vscode-eslint" "ESLint"
install_plugin "eamodio.gitlens" "Git lens"
install_plugin "EditorConfig.EditorConfig" "EditorConfig"
install_plugin "file-icons.file-icons" "File icons"
install_plugin "formulahendry.auto-close-tag" "Auto close tag"
install_plugin "formulahendry.auto-rename-tag" "Auto rename tag"
install_plugin "Gruntfuggly.todo-tree" "Todo comments explorer"
install_plugin "ionutvmi.path-autocomplete" "Path autocomplete"
install_plugin "oouo-diogo-perdigao.docthis" "JSDoc comments generator"
install_plugin "mikestead.dotenv" "Dotenv syntax highlighter"
install_plugin "octref.vetur" "Vue tooling"
install_plugin "redhat.vscode-yaml" "YAML Language Support"
install_plugin "remimarsal.prettier-now" "Prettier"
install_plugin "streetsidesoftware.code-spell-checker" "Code spell checker"
install_plugin "wix.vscode-import-cost" "Display package size"
install_plugin "zhuangtongfa.material-theme" "Theme"


# Close VSCode
osascript -e 'quit app "Visual Studio Code"'
