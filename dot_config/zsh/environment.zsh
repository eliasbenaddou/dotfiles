# ------------------------------------------------------------------------------
# Environment variables relevant only to interactive shells
# ------------------------------------------------------------------------------

# Default editor (VS Code; --wait blocks until the file is closed, needed by git)
export EDITOR="code --wait"
export VISUAL="$EDITOR"

# Hide computer name in terminal (for prompt usage)
export DEFAULT_USER="$(whoami)"
