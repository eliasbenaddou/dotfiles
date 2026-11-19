# Disable zoxide's startup self-check. It false-positives in shells that restore
# functions from a snapshot without the precmd hooks (e.g. Claude Code's tool shell).
export _ZO_DOCTOR=0

eval "$(zoxide init --cmd cd zsh)"
