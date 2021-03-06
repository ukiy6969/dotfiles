#!/bin/bash

DIR=$(realpath $(dirname $0))
echo $DIR

install_minimum()
{
  local ignore=(".git" ".gitignore" ".atom" ".config" ".ghc" ".ideavimrc")
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

install_config()
{
  mkdir -p $HOME/.config
  for d in ${DIR}/config/*/
  do
    ln -sfnv "$DIR/config/$(basename $d)" $HOME/.config/$(basename $d)
  done
}

install_minimum
install_config
