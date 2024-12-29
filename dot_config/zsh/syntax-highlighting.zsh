# ------------------------------------------------------------------------------
# Zsh Syntax Highlighting Configuration
# ------------------------------------------------------------------------------

if command -v brew &>/dev/null; then
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Disable underlining, etc.
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
