FROM greyltc/archlinux

ENV USER=ukiy HOME=/home/ukiy SHELL=/bin/zsh

RUN \
  pacman -Syy && \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm base-devel sudo git zsh neovim python2-neovim python-neovim tmux \
    haskell-stack \
  && \
  useradd -m -G wheel -s /bin/zsh $USER

ADD config $HOME/dotfiles/config
ADD install.sh $HOME/dotfiles

RUN \
  chown -R $USER:$USER $HOME/dotfiles

USER $USER

WORKDIR /home/ukiy

RUN \
  stack --install-ghc --resolver=lts-7.19 install ghc-mod hlint hasktags hscope pointfree pointful hoogle apply-refact && \
  mkdir -p "${HOME}/working" && \
  bash -c "${HOME}/dotfiles/install.sh"

VOLUME ${HOME}/working

CMD ["zsh"]
