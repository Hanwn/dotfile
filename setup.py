'''
 - Author : hanwn
 - Date : 11-07-2021
 - FileName : setup.py
 - Email : hanwn7721@gmail.com
 - Description : 
'''

import os
import shutil


def check_is_symbol_link_and_not_broken(filename:str) -> tuple:
    ''' check current file is symlink and broken

    @parameter:type str
     input filename (absolute path)
    @return: type tuple(bool, bool)

     first_place : represent current file is a symlink
     second_place : represent current file's symlink is broken or not

    '''
    if os.path.islink(filename):
        if os.path.exists(filename):
            return True, True
        else:
            return True, False
    else:
        return False, False


def check_dir(name:str)-> bool:
    '''check current name is dir or not

    @Parameter: type str

    @return: type bool
     represent current file is dir or not
     True : a dir
     Flase : not a dir

    '''
    if os.path.isdir(name):
        return True
    return False


def create_symbol_link(src :list, target :list) -> None:
    '''create symbol link for config file

    @Parameter: type list,list
     src : real file location
     target : symlink saved location

    @return None

    '''
    for s, t in zip(src, target):
        is_link, link_effect = check_is_symbol_link_and_not_broken(t)
        if is_link:
            if link_effect:
                continue
            else:
                os.unlink(t)
        else:
            # This branch aims at removing file or dir.
            # t is not a symlink, but it coutld be dir or file, or not existence.
            # So it necessary to check it.
            if os.path.exists(t):
                if check_dir(t):
                    # t is a directory
                    if len(os.listdir(t)) == 0:
                        os.rmdir(t)
                    else:
                        shutil.rmtree(t)
                else:
                    # t is just a file.
                    os.remove(t)
        os.symlink(s, t)


def main() -> None:
    # user_src representes dotfiles directory
    user_src :str = os.getcwd()
    user_target = '/'.join(user_src.split('/')[:-1])
    src_list, target_list = [], []

    nvim_target_path :str = os.path.join(user_target, ".config/nvim")
    tmux_target_path :str = os.path.join(user_target, '.tmux.conf')
    # zsh_target_path :str = os.path.join(user_target, '.zshrc')
    git_target_path :str = os.path.join(user_target, '.gitconfig')

    target_list.append(nvim_target_path)
    target_list.append(tmux_target_path)
    # target_list.append(zsh_target_path)
    target_list.append(git_target_path)


    nvim_src_path :str = os.path.join(user_src, "nvim")
    tmux_src_path :str = os.path.join(user_src, 'tmux/tmux.conf')
    # zsh_src_path :str = os.path.join(user_src, 'zsh/zshrc')
    git_src_path :str = os.path.join(user_src, 'git/gitconfig')

    src_list.append(nvim_src_path)
    src_list.append(tmux_src_path)
    # src_list.append(zsh_src_path)
    src_list.append(git_src_path)

    create_symbol_link(src_list, target_list)


if __name__ == "__main__":
    main()

