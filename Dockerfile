FROM greyltc/archlinux

ENV USER=ukiy HOME=/home/ukiy SHELL=/bin/zsh

RUN \
  echo $'[archlinuxfr] \n\
SigLevel = Never \n\
Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf && \
  pacman -Syy && \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm base-devel sudo git zsh vim \
    package-query \
    neovim python2-neovim python-neovim tmux ctags \
    haskell-stack && \
  pacman --sync --refresh --noconfirm yaourt

RUN \
  useradd -m -G wheel -s /bin/zsh $USER && \
  echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
  echo "root:" | chpasswd -e && \
  echo "ukiy:" | chpasswd -e

ADD config $HOME/dotfiles/config
ADD install.sh $HOME/dotfiles

RUN \
  chown -R $USER:$USER $HOME/dotfiles

USER $USER

WORKDIR /home/ukiy

RUN \
  yaourt --noconfirm -S par && \
  mkdir -p "${HOME}/working" && \
  bash -c "${HOME}/dotfiles/install.sh"

RUN \
  stack --install-ghc --resolver=lts-7.19 install ghc-mod hlint hasktags hscope pointfree pointful hoogle apply-refact

VOLUME ${HOME}/working

CMD ["zsh"]
