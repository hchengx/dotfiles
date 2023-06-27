#!/usr/bin/env bash

DOTFILES="$(pwd)"

COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
    echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
    exit 1
}

warning() {
    echo -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
    echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
    echo -e "${COLOR_GREEN}$1${COLOR_NONE}"
}

get_linkables() {
    find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

setup_git() {
    title "Setting up Git"

    defaultName=$(git config user.name)
    defaultEmail=$(git config user.email)
    defaultGithub=$(git config github.user)

    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email
    read -rp "Github username [$defaultGithub] " github

    git config -f ~/.gitconfig-local user.name "${name:-$defaultName}"
    git config -f ~/.gitconfig-local user.email "${email:-$defaultEmail}"
    git config -f ~/.gitconfig-local github.user "${github:-$defaultGithub}"

    if [[ "$(uname)" == "Darwin" ]]; then
        git config --global credential.helper "osxkeychain"
    else
        read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
        if [[ $save =~ ^([Yy])$ ]]; then
            git config --global credential.helper "store"
        else
            git config --global credential.helper "cache --timeout 3600"
        fi
    fi
}

setup_alacritty() {
    title "Setting up Alacritty"
    # TODO: error check
    ln -s "${DOTFILES}/alacritty/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"
}

setup_neovim() {
    title "Setting up Neovim"
    INIT_PATH="${HOME}/.config"
    if [ -d "${INIT_PATH}/nvim" ]; then
        mv "${INIT_PATH}/nvim" /tmp/
    fi
    if [ -d "${DOTFILES}/nvim" ]; then
        ln -s "${DOTFILES}/nvim" "${INIT_PATH}"
    else
        error "nvim config not found!"
    fi
}

case "$1" in
    neovim)
        setup_neovim
        ;;
    git)
        setup_git
        ;;
    all)
        setup_git
        setup_neovim
        setup_alacritty
        ;;
    *)
        echo -e $"\nUsage: $(basename "$0") {git|neovim|all}\n"
        exit 1
        ;;
esac


echo -e
success "Done."
