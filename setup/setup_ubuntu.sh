#!/bin/bash

# colors define

function install() {
    command sudo apt update
    softwares=(wget
        curl
        git
        tmux
        neovim
        vim 
        ranger
        tldr
        make 
        cmake 
        gcc 
        gdb 
        g++ 
        clang 
        cloc
        clangd
        silversearcher-ag 
        fzf 
        fd-find
        tree 
        zsh
        python3-pip
        lua5.3
        bat
        fd-find
    )
    for soft in "${softwares[@]}";
    do
        cli="sudo apt install ${soft}"
        eval ${cli}
    done
}

### add source for update nvim
command grep -rhE ^deb /etc/apt/sources.list* | grep neovim > /dev/null
if [ $? != 0 ]; then
    sudo add-apt-repository ppa:neovim-ppa/stable
fi

### install nodejs to latest
nodev=$(node -v | awk -F . {'print int(substr($1, 2, length($1)))'})
if [ $nodev -lt 16 ]; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

### install golang 
command -v go version > /dev/null
if [ $? != 0 ];then
    curl -LO https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go &&sudo tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.env.zsh
    echo "export GO111MODULE=on" >> $HOME/.env.zsh
    echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> $HOME/.env.zsh
fi

#### install rust
echo " install RUST"
command -v rustup > /dev/null
if [ $? != 0 ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo '. "$HOME/.cargo/env"' >> $HOME/.env.zsh
fi

## install lazygit use golang
command -v lazygit > /dev/null
if [ $? != 0 ]; then
    command go install github.com/jesseduffield/lazygit@latest
fi


echo -e " \033[1;33m======= INSTALL SOFTWARE =======>\033[0m 🚀"
install

# alias for bat
if [[ ! -e /usr/bin/bat && ! -s /usr/bin/bat ]]; then
    sudo ln -s /usr/bin/batcat /usr/bin/bat
fi

# alias for python
if [[ ! -e /usr/bin/python && ! -s /usr/bin/python ]]; then
    sudo ln -s /usr/bin/python3 /usr/bin/python
fi

# alias for fd
if [[ ! -e /usr/bin/fd && ! -s /usr/bin/fd ]]; then
    sudo ln -s /usr/bin/fdfind /usr/bin/fd
fi

##### install vim-plug for nvim
echo " Install vim plug"

plugvim="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
if [ ! -e ${plugvim} ];
then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

nvim --headless +PlugInstall +qall


##### set for zsh

echo " Install omz"

# install oymyzsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# chsh
cursh=$SHELL
if [[ ${cursh} != *"zsh"* ]]; then
    if $(grep -qF '/usr/zsh' /etc/shells);then
        command chsh --shell /usr/zsh $(whoami)
    elif $(grep -qF '/usr/bin/zsh' /etc/shells);then
        command chsh --shell /usr/bin/zsh $(whoami)
    fi
fi


##### install tmux-plug

echo " Install tmux plug"

if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf
fi

#### install MODERN unix software
# https://github.com/ibraheemdev/modern-unix
command -v duf > /dev/null
if [ $? != 0 ];then
    command go install github.com/muesli/duf@latest
fi

command -v lsd > /dev/null
if [ $? != 0 ];then
    command cargo install lsd
fi

command -v procs > /dev/null
if [ $? != 0 ]; then
    command cargo install procs
fi


