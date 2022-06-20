#!/bin/bash
success=()
fail=()


function install() {
    command sudo pacman -Sy
    command sudo pacman -S neovim vim
    command sudo pacman -S nodejs golang python-pip lua
    command sudo pacman -S cmake make gdb llvm gcc g++ clang
    command sudo pacman -S ranger lazygit tmux zsh
    command sudo pacman -S fzf the_silver_searcher bat duf tree
}


echo -e " \033[1;33m======= INSTALL SOFTWARE =======>\033[0m 🚀"

install


# install ohmyzsh

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

echo " install RUST"
command -v rustup > /dev/null
if [ $? != 0 ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo '. "$HOME/.cargo/env"' >> $HOME/.env.zsh
fi

# install typescript
command -v tsc > /dev/null
if [ $? != 0 ]; then
  npm install -g tsc
fi

