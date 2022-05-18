#!/bin/bash

# colors define

function install() {
    command brew update
    brew install wget curl -y
    brew install git -y
    brew install tmux lazygit neovim vim ranger -y
    brew install nodejs  -y
    brew install make cmake gcc gdb g++ clang clangd -y
    brew install tree cloc -y
    brew install silversearcher-ag fzf fd-find -y
    brew install zsh -y
}


echo -e " \033[1;33m======= INSTALL SOFTWARE =======>\033[0m 🚀"
install

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



