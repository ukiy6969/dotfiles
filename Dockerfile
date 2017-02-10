FROM greyltc/archlinux

ENV USER=ukiy HOME=/home/ukiy SHELL=/bin/zsh

RUN \
  pacman -Syy && \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm base-devel sudo git zsh neovim python2-neovim python-neovim tmux && \
  useradd -m -G wheel -s /bin/zsh $USER

ADD config $HOME/dotfiles/config
ADD install.sh $HOME/dotfiles

RUN \
  chown -R $USER:$USER $HOME/dotfiles

USER $USER

WORKDIR /home/ukiy

RUN \
  mkdir -p "${HOME}/working" && \
  bash -c "${HOME}/dotfiles/install.sh"

VOLUME ${HOME}/working

CMD ["zsh"]
