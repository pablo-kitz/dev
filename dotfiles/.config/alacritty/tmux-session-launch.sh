#!/bin/bash
# Ensures three named tmux sessions exist, attaches to the most recently used
# If none exist, creates all three and attaches to 'main'

SESSIONS=(builderduck batea dev)

# Create builderduck session if missing
if ! tmux has-session -t builderduck 2>/dev/null; then
  # Window 1: ~/code/pagebuilder
  tmux new-session -d -s builderduck -c "$HOME/code/pagebuilder" -n pagebuilder
  # Window 2: split, pane 1 in apps/admin, pane 2 in apps/front
  tmux new-window -t builderduck:2 -n apps -c "$HOME/code/pagebuilder/apps/admin"
  tmux split-window -h -t builderduck:2 -c "$HOME/code/pagebuilder/apps/front"
  tmux select-window -t builderduck:1
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
last_attached=$(tmux list-sessions -F "#{session_name} #{session_last_attached}" \
    | grep -E "^(builderduck|batea|dev) " \
    | sort -k2 -nr \
    | head -n1 \
    | awk '{print $1}')

# If none of the three have ever been attached, default to 'builderduck'
if [ -z "$last_attached" ]; then
    last_attached="builderduck"
fi

exec tmux attach-session -t "$last_attached"
