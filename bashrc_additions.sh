# Ideal Developer Desktop: Pulse theme
# Append this file to ~/.bashrc; do not replace your existing configuration.

# Consistent dark, high-contrast prompt
if [ -n "$PS1" ]; then
  export CLICOLOR=1
  export TERM="${TERM:-xterm-256color}"
  PS1='\[\033[1;36m\]\u@\h\[\033[0m\] \[\033[1;35m\]\w\[\033[0m\] \[\033[1;32m\]❯\[\033[0m\] '
fi

# Short, practical developer aliases
alias ll='ls -lah --color=auto'
alias gs='git status --short --branch'
alias gl='git log --oneline --graph --decorate -10'
alias croot='cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"'
alias update-status='bash ~/ideal-developer-desktop/scripts/system-status.sh'

# Safer defaults
alias ..='cd ..'
alias ...='cd ../..'
