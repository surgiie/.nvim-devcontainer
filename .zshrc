#!/bin/bash
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
export PS1="╰─➤  (devcontainer) "

if [[ -f $PYENV_ROOT/bin/pyenv ]]  && [[ -n "$(pyenv version | awk '{print $1}')" ]]; then
    export PATH="$PATH:$PYENV_ROOT/versions/$(pyenv version | awk '{print $1}')/bin"
fi

if [ ! -f ~/.fzf/install ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi


if [ ! -f ~/.fzf/plugins/fzf-tab/fzf-tab.plugin.zsh ]; then
   mkdir -p ~/.fzf/plugins
   git clone https://github.com/Aloxaf/fzf-tab ~/.fzf/plugins/fzf-tab
fi
source ~/.fzf/plugins/fzf-tab/fzf-tab.plugin.zsh

if [ ! -f ~/.fzf/plugins/forgit/forgit.plugin.zsh ]; then
    mkdir -p ~/.fzf/plugins
    git clone https://github.com/wfxr/forgit.git ~/.fzf/plugins/forgit
fi
source ~/.fzf/plugins/forgit/forgit.plugin.zsh

[ -s "$HOME/nvm.sh" ] && \. "$HOME/nvm.sh"

alias vim="nvim"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
autoload -U compinit; compinit
