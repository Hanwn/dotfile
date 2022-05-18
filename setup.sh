#!/bin/bash

pip install -r ./requirements.txt
python ./setup.py

git submodule init
git submodule update

source "./setup/setup_ubuntu.sh"
