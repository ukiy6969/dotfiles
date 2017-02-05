FROM greyltc/archlinux

ENV USER=ukiy HOME=/home/ukiy SHELL=/bin/zsh

RUN \
  pacman -Syy && \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm sudo git zsh neovim tmux && \
  useradd -m -G wheel -s /bin/bash $USER

USER $USER

WORKDIR /home/ukiy

RUN \
  git clone https://github.com/ukiy6969/dotfiles.git $HOME/dotfiles && \
  bash -c "${HOME}/dotfiles/install.sh"

CMD ["bash"]
