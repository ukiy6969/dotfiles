FROM alpine:latest

ENV USER=ukiy HOME=/home/ukiy SHELL=/bin/zsh

RUN \
  echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  apk --update add \
    bash \
    zsh \
    git \
    neovim && \
  adduser -S $USER

USER $USER

WORKDIR /home/ukiy

RUN \
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" && \
  git clone https://github.com/ukiy6969/dotfiles.git "${HOME}/dotfiles" && \
  bash -c "${HOME}/dotfiles/install.sh" && \
  git clone https://github.com/yyuu/pyenv.git "${HOME}/.pyenv" && \
  git clone https://github.com/yyuu/pyenv-virtualenv.git "${HOME}/.pyenv/plugins/pyenv-virtualenv"

CMD ["zsh"]
