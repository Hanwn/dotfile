#!/bin/bash

git submodule init
git submodule update

source "./setup/setup_ubuntu.sh"

pip install -r ./requirements.txt
python ./setup.py
