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
}

install_minimum
