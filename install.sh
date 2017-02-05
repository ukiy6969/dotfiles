#!/bin/bash

# zsh config
DIR=$(dirname $0)
for f in $DIR/zsh/??*
do
  ln -s $f "${HOME}/.$(basename $f)"
done

ln -s $(realpath "${DIR}/config") "${HOME}/.config"

pyenv install 2.7.11
pyenv install 3.4.4

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.4.4 neovim3

pyenv activate neovim2
pip install neovim
pyenv which python  # Note the path

pyenv activate neovim3
pip install neovim
pyenv which python  # Note the path
