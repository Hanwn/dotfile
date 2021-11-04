#/bin/bash

nvim_link=~/.config/nvim

function make_nvim_link() {
    if [ -L ${nvim_link} ]; then
        rm ${nvim_link}
    fi
    ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
}




make_nvim_link
