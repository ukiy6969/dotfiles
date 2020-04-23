#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# startup tmux
# if [ "$TMUX" = "" ]; then tmux; fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# LANG to us
# export LANG=en_US.utf8

# EDITOR
command -v nvim > /dev/null && export EDITOR=nvim

# Customize to your needs...

# alias
alias re="exec $SHELL -l"

# XDG_CONFIG

export XDG_CONFIG_HOME=$HOME/.config

# local
export PATH="$HOME/.local/bin":$PATH

# for yaourt
export VISUAL="vim"

# for nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
command -v npm > /dev/null && export PATH="$(npm bin -g):$PATH"

# for rust
[ -f ~/.cargo/env ] && source ~/.cargo/env
export VTE_CJK_WIDTH=1
fpath+=~/.zfunc

# go
export PATH=$PATH:$HOME/go/bin
[ -f ~/.gvm/scripts/gvm ] && source ~/.gvm/scripts/gvm

# load loal zshrc
if [ -f "$HOME/.zshrc.local" ]; then source "$HOME/.zshrc.local"; fi

# direnv
command -v direnv > /dev/null && eval "$(direnv hook zsh)"

# kubectl completion
command -v kubectl > /dev/null && source <(kubectl completion zsh)
alias k=kubectl

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv > /dev/null && eval "$(rbenv init -)"
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
export PATH="/usr/local/sbin:$PATH"
