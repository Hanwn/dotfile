'''
 - Author : hanwn
 - Date : 11-07-2021
 - FileName : setup.py
 - Email : hanwn7721@gmail.com
 - Description : 
'''

import os


def check_is_symbol_link_and_not_broken(filename:str) -> tuple:
    if os.path.islink(filename):
        if os.path.exists(filename):
            return True, True
        else:
            return True, False
    else:
        return False, False


def create_symbol_link(src :str, target :str) -> None:
    pass


if __name__ == "__main__":
    user_src :str = os.getcwd()
    user_target = '/'.join(user_src.split('/')[:-1])
    user_src :str = os.getcwd()

    print(user_target,user_src)
    nvim_target_path :str = os.path.join(user_target, ".config/nvim")
    tmux_target_path :str = os.path.join(user_target, '.tmux.conf')
    zsh_target_path :str = os.path.join(user_target, '.zshrc')
