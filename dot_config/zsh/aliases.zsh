# --- System Management ---
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias sleep='pmset sleepnow'
alias c='clear'
alias e='exit'

# --- Git Basics: General Commands ---
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gf='git fetch'
alias gs='git status'
alias gss='git status -s'
alias gco='git checkout'
alias gcofzf='git branch | fzf | xargs git checkout' # Select branch with fzf

# --- Git Basics: Commit Commands ---
alias gc='git commit -v'
alias gcmnv='git commit --no-verify -m'
alias gcanenv='git commit --amend --no-edit --no-verify'

# --- Git Basics: Pull and Push Commands ---
alias glo='git pull origin'
alias gp='git pull'
alias gpp='git push'
alias gpo='git push origin'
alias ggpush='git push origin $(current_branch)'

# --- Git Basics: Stash Commands ---
alias gsh='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'

# --- Git Branching ---
alias gb='git branch'
alias gbr='git branch -r'
alias gcob='git checkout -b'
alias gm='git merge'

# --- Git Tagging ---
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'

# --- Git Diff and Restore ---
alias gd='git diff'
alias grfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore' # Git restore with fzf
alias grsfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged' # Git restore --staged with fzf

# --- Git Remote ---
alias gre='git remote'
alias gres='git remote show'

# --- Git Log ---
alias gl='git log --graph --max-count=5 --decorate --pretty="oneline"'

# --- Git Fuzzy Finder Integrations ---
alias gafzf='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add' # Git add with fzf
alias grmfzf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm' # Git rm with fzf

# --- Git Rebase & Update ---
alias gup='git fetch && git rebase'

# --- Git Commit Functions ---
gcm() {
  git commit -m "$*"
}

quick_commit() {
  local branch_name ticket_id commit_message push_flag
  branch_name=$(git branch --show-current)
  ticket_id=$(echo "$branch_name" | awk -F '-' '{print toupper($1"-"$2)}')
  commit_message="$ticket_id: $*"
  push_flag=$1

  if [[ "$push_flag" == "push" ]]; then
    commit_message="$ticket_id: ${*:2}" # take all positional parameters starting from the second one
    git commit --no-verify -m "$commit_message" && git push
  else
    git commit --no-verify -m "$commit_message"
  fi
}

alias gqc='quick_commit'
alias gqcp='quick_commit push'

# --- Helix Integration ---
poetry_uv_run_hx() {
  if command -v poetry >/dev/null 2>&1 && [ -f "poetry.lock" ]; then
    poetry run hx "$@"
  elif command -v uv >/dev/null 2>&1 && [ -f "uv.lock" ]; then
    uv run hx "$@"
  else
    hx "$@"
  fi
}
alias h='poetry_uv_run_hx'
alias prp='poetry run python'

# # Helix Search
# hxs() {
#     RG_PREFIX="rg -i --files-with-matches"
#     local files
#     files="$(
#         FZF_DEFAULT_COMMAND_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
#         fzf --multi 3 --print0 --sort --preview="[[ ! -z {} ]] && rg --pretty --ignore-case --context 5 {q} {}" \
#         --phony -i -q "$1" \
#         --bind "change:reload:$RG_PREFIX {q}" \
#         --preview-window="70%:wrap" \
#         --bind 'ctrl-a:select-all'
#     )"
# 	[[ "$files" ]] && hx --vsplit $(echo $files | tr \\0 " ")
# }



# # Helix Search with Immediate Filter
# hxs() {
#     RG_PREFIX="rg -i --files-with-matches"
#     local files
#     files="$(
#         FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
#             fzf --multi 3 --print0 --sort --preview="[[ ! -z {} ]] && rg --pretty --ignore-case --context 5 {q} {}" \
#                 --phony -i -q "$1" \
#                 --bind "enter:execute(reload:$RG_PREFIX {q})+clear-query" \
#                 --preview-window="70%:wrap" \
#                 --bind 'ctrl-a:select-all' \
#                 --bind "change:reload:$RG_PREFIX {q}" \
#     )"
#     [[ "$files" ]] && hx --vsplit $(echo $files | tr \\0 " ")
# }



# Helix Search with Immediate Filtering Fix
hxs() {
    RG_PREFIX="rg -i --files-with-matches"
    local files
    files="$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --multi --print0 --sort --preview="[[ -n {} ]] && rg --pretty --ignore-case --context 5 {q} {}" \
                --phony -i -q "$1" \
                --bind "change:reload($RG_PREFIX {q})" \
                --preview-window="70%:wrap" \
                --bind 'ctrl-a:select-all'
    )"
    [[ "$files" ]] && hx --vsplit $(echo "$files" | tr \\0 " ")
}

#--- Folder Shortcuts ---
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"

# --- Ranger File Manager ---
alias r=". ranger"

# --- Better ls ---
alias ls="eza --all --icons=always"
alias l="eza --all --icons=always"

# --- Lazygit Integration ---
alias lg="lazygit"
