#!/bin/bash

set -x

usage() {
    echo "Usage: $0 [--update] [--user]"
    echo "  --update: Install/update dependencies without checking ~/.gdbinit"
    echo "  --user: Install pip dependencies to the user's home directory"
}

UPDATE_MODE=
USER_MODE=
for arg in "$@"; do
    case $arg in
        --update)
            UPDATE_MODE=1
            ;;
        --user)
            USER_MODE=1
            ;;
        -h | --help)
            set +x
            usage
            exit 0
            ;;
        *)
            set +x
            echo "Unknown argument: $arg"
            usage
            exit 1
            ;;
    esac
done


# Helper functions
linux() {
    uname | grep -i Linux &> /dev/null
}
osx() {
    uname | grep -i Darwin &> /dev/null
}


# install area
install_apt() {
    sudo apt-get update || true
}

install_dnf() {
    sudo dnf update || true
    sudo dnf -y install git-delta \
                        nodejs \
                        tmux \
                        neovim \
                        ripgrep \
                        fzf \
                        lazygit \
                        the_silver_searcher \
                        lua5.3
}

install_xbps() {
    sudo xbps-install -Su
}

install_swupd() {
    sudo swupd update || true
}

install_zypper() {
    sudo zypper mr -e repo-debug

}

install_emerge() {
    emerge --oneshot --deep --newuse --changed-use --changed-deps dev-lang/python dev-python/pip sys-devel/gdb
}

install_pacman() {
    sudo pacman -Syy --noconfirm || true
}


usage() {
    echo "Usage: $0 [--update] [--user]"
    echo "  --update: Install/update dependencies without checking ~/.gdbinit"
    echo "  --user: Install pip dependencies to the user's home directory"
}

if linux; then
    distro=$(grep "^ID=" /etc/os-release | cut -d'=' -f2 | sed -e 's/"//g')

    case $distro in
        "ubuntu")
            install_apt
            ;;
        "fedora")
            install_dnf
            ;;
        "clear-linux-os")
            install_swupd
            ;;
        "opensuse-leap" | "opensuse-tumbleweed")
            install_zypper
            ;;
        "arch" | "archarm" | "endeavouros" | "manjaro" | "garuda")
            install_pacman
            echo "Logging off and in or conducting a power cycle is required to get debuginfod to work."
            echo "Alternatively you can manually set the environment variable: DEBUGINFOD_URLS=https://debuginfod.archlinux.org"
            ;;
        "void")
            install_xbps
            ;;
        "gentoo")
            install_emerge
            if ! hash sudo 2> /dev/null && whoami | grep root; then
                sudo() {
                    ${*}
                }
            fi
            ;;
        *) # we can add more install command for each distros.
            echo "\"$distro\" is not supported distro. Will search for 'apt' or 'dnf' package managers."
            if hash apt; then
                install_apt
            elif hash dnf; then
                install_dnf
            else
                echo "\"$distro\" is not supported and your distro don't have a package manager that we support currently."
                exit
            fi
            ;;
    esac
fi

# link
