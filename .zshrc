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
# docker-machine start
# eval $(docker-machine env)

. /home/ukiy/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# for SSH
#eval $(ssh-agent) > /dev/null

# Terminal
export TERM=xterm-256color

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

# for ruby
export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH

# for nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for scala
# alias sbt="TERM=xterm-color sbt"

# place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc


# for rust
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH
export PATH=$HOME/.multirust/toolchains/nightly/cargo/bin:$PATH
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export VTE_CJK_WIDTH=1
fpath+=~/.zfunc

# for webstorm
export PATH=$HOME/Downloads/WebStorm-162.1628.41/bin:$PATH

# for Ruby
export PATH=$HOME/.gem/ruby/2.4.0/bin:$PATH

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
