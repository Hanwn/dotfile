#!/bin/bash

nvim_link=~/.config/nvim
git_link=${HOME}/.gitconfig


function make_nvim_link() {
    if [ -e ${nvim_link} ]
    then
        if [ ! -L ${nvim_link} ]
        then
            rm ${nvim_link}
            ln -s ${HOME}/dotfiles/nvim ${nvim_link}
        fi
    else
        ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
    fi

}

function make_git_link() {
    if [ -e ${git_link} ]
    then
        if [ ! -L ${git_link} ]
        then
            rm ${git_link}
            ln -s ${HOME}/dotfiles/git/gitconfig ${git_link}
        fi
    else
        ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
    fi
}



make_nvim_link
make_git_link
