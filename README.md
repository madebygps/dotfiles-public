# Zensh

This is my zsh configuration based off the [Dreams of Autonomy YouTube Channel](https://www.youtube.com/watch?v=ud7YxC33Z3w).

## Features

- [zoxide](https://github.com/ajeetdsouza/zoxide) is a faster way to navigate your filesystem than `cd`.
- [Starship](https://starship.rs/) is a customizable, minimal, and fast prompt for any shell.
- [fzf](https://github.com/junegunn/fzf) is a general-purpose command-line fuzzy finder.
- [zinit](https://github.com/zdharma-continuum/zinit) is a flexible and fast Zsh plugin manager.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) provides syntax highlighting for Zsh.
- [zsh-completions](https://github.com/zsh-users/zsh-completions) provides additional completion definitions for Zsh.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) suggests commands as you type based on history.
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) integrates fzf with Zsh tab completion.
- Custom keybindings for easier navigation and command editing.
- Enhanced history management with various settings to manage Zsh command history behavior.
- Customized completion styling and behavior for a better autocompletion experience.
- Useful aliases for commonly used commands.
- Shell integrations to enhance the functionality of the `cd` command with zoxide.

## Files

### .zshrc

This is the main configuration file for Zsh. It contains the configuration for the prompt, plugins, keybindings, aliases, and other settings.

### .starship.toml

This is the configuration file for the Starship prompt. It contains the configuration for the prompt appearance, elements, and behavior.

### Install.sh

- Detects if zsh is installed, if not, it will install it.
- Sets zsh as the default shell.
- Creates a backup of the current .zshrc file.
- Copies the .zshrc file from the repository to the home directory.
- Installs `zoxide` if it is not already installed.
- Installs `Starship` prompt if it is not already installed.
- Creates the `starship.toml` configuration file if it doesn't exist and copies the configuration from the repository.
- Installs `fzf` if it is not already installed.
- Installs `zinit` if it is not already installed.

## How to use

1. Clone the repository
2. `cd` into the repository
3. Make `install.sh` executable with `chmod +x install.sh`
4. Run the `install.sh` script.
5. Close and reopen your terminal.
6. This will trigger the .zshrc file to be detected and the plugins to be installed.
7. Enjoy!
