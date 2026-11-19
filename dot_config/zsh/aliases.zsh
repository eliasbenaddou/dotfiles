# --- System Management ---
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias sleepnow='pmset sleepnow'
alias c='clear'
alias e='exit'

# --- Git Basics: General Commands ---
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gf='git fetch --all'
alias gs='git status'
alias gco='git checkout'
alias gcofzf='git branch | fzf | xargs git checkout'

# --- Git Basics: Commit Commands ---
alias gc='git commit -v'
alias gcmnv='git commit --no-verify -m'

# --- Git Basics: Pull and Push Commands ---
alias gp='git pull'
alias gpp='git push'

# --- Git Basics: Stash Commands ---
alias gsh='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'

# --- Git Branching ---
alias gb='git branch'
alias gcob='git checkout -b'

# --- Git Diff and Restore ---
alias gd='git diff'
alias grfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore'
alias grsfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged'

# --- Git Remote ---
alias gre='git remote'
alias gres='git remote show'

# --- Git Log ---
alias gl='git log --graph --max-count=5 --decorate --pretty="oneline"'

# --- Git Fuzzy Finder Integrations ---
alias gafzf='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add'
alias grmfzf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm'

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
    commit_message="$ticket_id: ${*:2}"
    git commit --no-verify -m "$commit_message" && git push
  else
    git commit --no-verify -m "$commit_message"
  fi
}
alias gqc='quick_commit'
alias gqcp='quick_commit push'

# --- Folder Shortcuts ---
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"

# --- Better ls ---
alias ls="eza --all --icons=always"
alias l="eza --all --icons=always"

# --- Eject the Elias 4TB SSD (Photos daemons hold it even with Photos closed) ---
ejectssd() {
  local vol="/Volumes/Elias 4TB SSD"
  [ -d "$vol" ] || { echo "SSD not mounted"; return 0; }
  osascript -e 'tell application "Photos" to quit' 2>/dev/null
  killall photolibraryd managedcorespotlightd 2>/dev/null
  /bin/sleep 2
  if diskutil unmount "$vol"; then
    echo "Safe to unplug."
  else
    echo "Still busy. Processes holding it:"
    lsof 2>/dev/null | grep -F "$vol" | awk '{print $1, $2}' | sort | uniq -c | sort -rn
  fi
}
