#!/bin/bash

# zsh config
DIR=$(dirname $0)
for f in $DIR/config/zsh/??*
do
  ln -s $(realpath $f) "${HOME}/.$(basename $f)"
done

ln -s $(realpath "${DIR}/config") "${HOME}/.config"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone https://github.com/yyuu/pyenv.git "${HOME}/.pyenv"
git clone https://github.com/yyuu/pyenv-virtualenv.git "${HOME}/.pyenv/plugins/pyenv-virtualenv"

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

#pyenv install 2.7.11
#pyenv install 3.4.4
#
#pyenv virtualenv 2.7.11 neovim2
#pyenv virtualenv 3.4.4 neovim3
#
#pyenv activate neovim2
#pip install neovim
#pyenv which python  # Note the path
#
#pyenv activate neovim3
#pip install neovim
#pyenv which python  # Note the path
