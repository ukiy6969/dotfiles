#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# startup tmux
# if [ "$TMUX" = "" ]; then tmux; fi

# XDG_CONFIG

export XDG_CONFIG_HOME=$HOME/.config

# # Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi


# Sheldon
eval "$(sheldon source)"

autoload -U +X compinit
compinit

export PATH=/usr/local/bin:$PATH

# LANG to us
# export LANG=en_US.utf8

# EDITOR
command -v nvim > /dev/null && export EDITOR=nvim

# Customize to your needs...

# alias
alias re="exec $SHELL -l"

# local
export PATH="$HOME/.local/bin":$PATH

# for yaourt
export VISUAL="vim"

# direnv
command -v direnv > /dev/null && eval "$(direnv hook zsh)"

# for rust
[ -f ~/.cargo/env ] && source ~/.cargo/env
export VTE_CJK_WIDTH=1
fpath+=~/.zfunc

# go
command -v go > /dev/null && export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GO111MODULE="on"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv > /dev/null && eval "$(rbenv init -)"

# kubectl completion
command -v kubectl > /dev/null && source <(kubectl completion zsh)
alias k=kubectl

# skaffold completion
command -v skaffold > /dev/null && source <(skaffold completion zsh)

# load loal zshrc

if [ -f "$HOME/.zshrc.local" ]; then source "$HOME/.zshrc.local"; fi
