# ------------------------------------------------------------------------------
# Zsh Completions Setup
# ------------------------------------------------------------------------------

# Case-insensitive autosuggestions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

autoload -Uz compinit && compinit
