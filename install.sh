#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if zsh is installed; if not, install it
if ! command -v zsh &> /dev/null; then
    echo "zsh not found, installing..."
    sudo apt update && sudo apt install -y zsh
fi

# Set zsh as the default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as the default shell"
    chsh -s "$(which zsh)"
fi

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc to .zshrc.backup"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Copy the .zshrc file from the repository to the home directory
echo "Copying new .zshrc to home directory"
cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"

# Check if zoxide is installed; if not, install it
if ! command -v zoxide &> /dev/null; then
    echo "zoxide not found, installing..."
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Check if Starship prompt is installed; if not, install it
if ! command -v starship &> /dev/null; then
    echo "starship not found, installing..."
    curl -sS https://starship.rs/install.sh | sh
fi

# Backup existing .config folder if it exists
if [ -d "$HOME/.config" ]; then
    echo "Backing up existing .config folder to .config.backup"
    mv "$HOME/.config" "$HOME/.config.backup"
fi

# Create the .config directory and copy the starship.toml configuration file
echo "Creating .config directory and copying starship.toml configuration file"
mkdir -p "$HOME/.config"
cp "$SCRIPT_DIR/starship.toml" "$HOME/.config/starship.toml"

# Check if fzf (fuzzy finder) is installed; if not, clone and install it
if [ ! -d "$HOME/.fzf" ]; then
    echo "fzf not found, installing..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

# Check if zinit is installed; if not, install it
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Restart the terminal
echo "Installation complete. Please restart your terminal."