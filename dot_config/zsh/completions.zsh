# ------------------------------------------------------------------------------
# Zsh Completions Setup
# ------------------------------------------------------------------------------

alias ls='ls --color'

# Case-insensitive autosuggestions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Colour in completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit && compinit
