PROMPT=$'%{$fg_bold[blue]%}%D{[%H:%M:%S]} %{$fg_bold[green]%}%n %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)$(custom_git_status_prompt)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function custom_git_status_prompt() {
  local STATUS=""
  local ICONS=()
  
  # Check for git repo
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    # Get porcelain status
    local git_status=$(git status --porcelain 2>/dev/null)
    local ahead_behind=$(git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null)

    # File indicators
    if echo "$git_status" | grep -q "^??"; then
      ICONS+=("%{$fg_bold[blue]%}\uec0c%{$reset_color%}")  # unstaged (untracked)
    fi

    if echo "$git_status" | grep -q "^[MDA] "; then
      ICONS+=("%{$fg_bold[green]%}\ueb43%{$reset_color%}")  # staged changes
    fi

    # Ahead/behind
    if [[ -n "$ahead_behind" ]]; then
      local ahead=$(echo $ahead_behind | awk '{print $2}')
      local behind=$(echo $ahead_behind | awk '{print $1}')
      [[ "$behind" -gt 0 ]] && ICONS+=("%{$fg_bold[red]%}\ueb40%{$reset_color%}")
      [[ "$ahead" -gt 0 ]] && ICONS+=("%{$fg_bold[green]%}\ueb41%{$reset_color%}")
    fi

    # Build status with proper spacing: one space at start, two spaces between icons
    if [[ ${#ICONS[@]} -gt 0 ]]; then
      STATUS=" "  # One space at the start
      for i in {1..${#ICONS[@]}}; do
        STATUS+="${ICONS[$i]}"
        # Add two spaces between icons (but not after the last one)
        [[ $i -lt ${#ICONS[@]} ]] && STATUS+="  "
      done
    fi
  fi

  echo "$STATUS"
}
