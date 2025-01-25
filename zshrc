# Created by newuser for 5.9

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

# Alias
alias n="nvim"
alias nn="nvim ."

alias gs="git status"
alias gl="git log"
alias glL="git log --oneline"
alias ga="git add"
alias gc="git commit"
alias gcA="git commit --amend --no-edit"
alias gp="git push"
alias gr="git restore"

export TERM="xterm-256color"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
