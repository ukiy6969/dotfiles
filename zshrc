#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


# alias
alias vim=nvim
alias re="exec $SHELL"
alias dockernone="sudo docker images | awk '/^<none>/ { print $3 }'"
alias tmux="TERM=tmux-256color tmux"

. /home/ukiy/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# for SSH
#eval $(ssh-agent) > /dev/null

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

    if (( $# > 0 )); then
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi

        export http_proxy="http://$1/"
        export https_proxy=$http_proxy
        export ftp_proxy=$http_proxy
        export rsync_proxy=$http_proxy
        echo "Proxy environment variable set."
        return 0
    fi

    echo -n "server: "; read server
    echo -n "port: "; read port
    export http_proxy="http://$pre$server:$port/"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export FTP_PROXY=$http_proxy
    export RSYNC_PROXY=$http_proxy
}

function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    echo -e "Proxy environment variable removed."
}

# Terminal
export TERM=xterm-256color

# XDG_CONFIG

export XDG_CONFIG_HOME=$HOME/.config

# local
export PATH="$HOME/.local/bin":$PATH

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# for yaourt
export VISUAL="vim"

# for ruby
export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH

# for nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH

# for rust
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH
export PATH=$HOME/.multirust/toolchains/nightly/cargo/bin:$PATH
export RUST_SRC_PATH="/home/ukiy/tmp/rustc-1.8.0/src"
export VTE_CJK_WIDTH=1

# for webstorm
export PATH=$HOME/Downloads/WebStorm-162.1628.41/bin:$PATH

# for Ruby
export PATH=$HOME/.gem/ruby/2.4.0/bin:$PATH