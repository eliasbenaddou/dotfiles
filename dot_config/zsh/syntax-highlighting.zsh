# ------------------------------------------------------------------------------
# Zsh Syntax Highlighting Configuration
# ------------------------------------------------------------------------------

source "$HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Disable underlining, etc.
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
