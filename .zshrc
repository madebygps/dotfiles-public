# Set up $PATH with .local/bin and .fzf/bin directories
export PATH="$HOME/.local/bin:$HOME/.fzf/bin:$PATH"

# Initialize Starship prompt to customize shell prompt appearance
eval "$(starship init zsh)"

# Ensure fzf shell configuration is sourced if the file exists
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Source/Load zinit to enable plugin management
source "${ZINIT_HOME}/zinit.zsh"

# Load zsh plugins with zinit
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load additional zsh snippets with zinit
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::azure

# Load zsh completion system
autoload -Uz compinit && compinit

# Enable zinit's command replay to remember plugin history
zinit cdreplay -q

# Keybindings for easier navigation and command editing
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History settings to manage zsh command history behavior
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling and behavior
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases for commonly used commands
alias ls='ls --color'
alias c='clear'

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"