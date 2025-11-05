#!/bin/bash
# Ensures three named tmux sessions exist, then opens the session chooser
# If none exist, creates all three

SESSIONS=(builderduck batea dev)

# Create builderduck session if missing
if ! tmux has-session -t builderduck 2>/dev/null; then
  tmux new-session -d -s builderduck -c "$HOME/code/pagebuilder" -n root
fi

# Create batea session if missing
if ! tmux has-session -t batea 2>/dev/null; then
  tmux new-session -d -s batea -c "$HOME/code/batea" -n batea
fi

# Create dev session if missing
if ! tmux has-session -t dev 2>/dev/null; then
  tmux new-session -d -s dev -c "$HOME/dev" -n dev
fi

# Find the most recently used session among the three
last_attached=$(tmux list-sessions -F "#{session_name} #{session_last_attached}" |
  grep -E "^(builderduck|batea|dev) " |
  sort -k2 -nr |
  head -n1 |
  awk '{print $1}')

# If none of the three have ever been attached, default to 'builderduck'
if [ -z "$last_attached" ]; then
  last_attached="builderduck"
fi

# Attach and immediately show the session chooser
exec tmux attach-session -t "$last_attached" \; choose-tree
