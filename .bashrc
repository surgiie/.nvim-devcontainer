#!/bin/bash
# Customize as needed
export VISUAL=nvim
export GIT_EDITOR=nvim
export EDITOR="$VISUAL"
export DOCKER_CLI_HINTS=false
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/bin/nvim/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:/home/devcontainer/.local/bin"
export PATH="/home/devcontainer/.config/composer/vendor/bin:$PATH"
export PYTHON=$(which python3)
export PATH="$PYENV_ROOT/bin:$PATH"

if [[ -f $PYENV_ROOT/bin/pyenv ]]  && [[ -n "$(pyenv version | awk '{print $1}')" ]]; then
    export PATH="$PATH:$PYENV_ROOT/versions/$(pyenv version | awk '{print $1}')/bin"
fi

[ -s "$HOME/nvm.sh" ] && \. "$HOME/nvm.sh"
[ -s "$HOME/bash_completion" ] && \. "$HOME/bash_completion" # This loads nvm bash_completion
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

alias vim="nvim"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
