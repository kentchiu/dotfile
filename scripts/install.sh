#!/bin/bash

# Install package managers based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install Homebrew on macOS
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Install common tools
    brew install git tmux neovim ripgrep fd fzf
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Update package lists on Linux
    if [ -f "/etc/debian_version" ]; then
        sudo apt update
        sudo apt install -y git tmux neovim ripgrep fd-find fzf
    elif [ -f "/etc/arch-release" ]; then
        sudo pacman -Syu
        sudo pacman -S --noconfirm git tmux neovim ripgrep fd fzf
    fi
fi

# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"

# Initialize dotfiles
chezmoi init --apply $GITHUB_USERNAME
