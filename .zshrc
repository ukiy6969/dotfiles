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

# Customize to your needs...

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# alias
alias re="exec $SHELL -l"

dockerrmall() {
  docker rm $(docker ps -aq)
}

# XDG_CONFIG

export XDG_CONFIG_HOME=$HOME/.config

# local
export PATH="$HOME/.local/bin":$PATH

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# export PATH=$PATH:$HOME/Library/Python/3.6/bin

# for yaourt
export VISUAL="vim"

# for nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$(npm bin -g):$PATH"

# for rust
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH
export PATH=$HOME/.multirust/toolchains/nightly/cargo/bin:$PATH
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export VTE_CJK_WIDTH=1
fpath+=~/.zfunc

# only for mac 
# http://www.task-notes.com/entry/20141223/1419324649
alias brew='env PATH=${PATH//$HOME\/.pyenv\/shims:/} brew'
export PATH=$PATH:/usr/libexec

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HOMEBREW_GITHUB_API_TOKEN="573d36351e6a841c2d4e26d81f884ee33b44b088"

export PATH=$PATH:$HOME/go/bin

# load loal zshrc
if [ -f "$HOME/.zshrc.local" ]; then source "$HOME/.zshrc.local"; fi

# direnv
eval "$(direnv hook zsh)"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
