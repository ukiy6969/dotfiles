#!/bin/bash

DIR=$(realpath $(dirname $0))

install_minimum()
{
  local ignore=(".git" ".gitignore" ".atom" ".config" ".ghc" ".gitconfig" ".ideavimrc")
  for f in .??*
  do
    # check ignore
    for i in ${ignore[@]}
    do
      [[ "$f" == "$i" ]] && break
    done
    [[ $? == 0 ]] && continue

    ln -sfnv "${DIR}/${f}" "${HOME}/${f}"
  done

  # tmux setup
  [[ ! -d ~/.tmux/plugins/tpm ]] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # zprezto
  [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
}

install_minimum
