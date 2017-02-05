#!/bin/bash

DIR=$(dirname $0)
for f in $DIR/zsh/??*
do
  ln -s $f "${HOME}/.$(basename $f)"
done
