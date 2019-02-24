#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# startup tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# LANG to us
export LANG=en_US.utf8

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
command -v npm && export PATH="$(npm bin -g):$PATH"

# for rust
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH
export PATH=$HOME/.multirust/toolchains/nightly/cargo/bin:$PATH
command -v rustc && export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export VTE_CJK_WIDTH=1
fpath+=~/.zfunc

# only for mac 
# http://www.task-notes.com/entry/20141223/1419324649
alias brew='env PATH=${PATH//$HOME\/.pyenv\/shims:/} brew'
export PATH=$PATH:/usr/libexec

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$HOME/go/bin

# load loal zshrc
if [ -f "$HOME/.zshrc.local" ]; then source "$HOME/.zshrc.local"; fi

# direnv
command -v direnv && eval "$(direnv hook zsh)"

# kubectl completion
command -v kubectl && source <(kubectl completion zsh)
alias k=kubectl

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv && eval "$(rbenv init -)"
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# XKB caps to ctrl
export XKB_DEFAULT_OPTIONS=ctrl:nocaps,

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
