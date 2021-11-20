'''
 - Author : hanwn
 - Date : 11-07-2021
 - FileName : setup.py
 - Email : hanwn7721@gmail.com
 - Description : 
'''

import os
import shutil
from git.repo import Repo


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


def git_clone() -> None:
    """ clone some repoes the project needed"""

    git_src_dir = ['https://github.com/alexanderjeurissen/ranger_devicons.git']
    git_target_dir = ["./ranger/plugins/ranger_devicons/"]
    for src, target in zip(git_src_dir, git_target_dir):
        if os.path.exists(target):
            continue
        Repo.clone_from(src, target)


def target_prepare(user_target:str) -> list:
    """prepare target list
    @Parameter:
    user_target: create a symlink where we want

    @Return: None
    """
    ret = []
    target_list = [".config/nvim", ".tmux.conf", ".gitconfig", ".config/ranger"]
    for _, item in enumerate(target_list):
        ret.append(os.path.join(user_target, item))
    
    return ret


def src_prepare(user_src) -> list:
    """prepare source list
    @Parameter:
    user_src: the source file in dotfiles dir
    """
    ret = []
    src_list = ["nvim", 'tmux/tmux.conf', 'git/gitconfig', 'ranger']
    for _, item in enumerate(src_list):
        ret.append(os.path.join(user_src, item))

    return ret


def main() -> None:
    # user_src represents dotfiles directory
    git_clone()
    user_src :str = os.getcwd()
    user_target = '/'.join(user_src.split('/')[:-1])
    src_list, target_list = src_prepare(user_src), target_prepare(user_target)

    create_symbol_link(src_list, target_list)


if __name__ == "__main__":
    main()
