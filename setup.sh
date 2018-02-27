#!/bin/bash

set -x

workon_home="~/.pyenv/ve"
project_home="~/src"
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev fonts-powerline

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

command -v pip3 1>/dev/null 2>&1  || sudo apt install python3-pip
command -v neovim 1>/dev/null 2>&1  || sudo pip3 install neovim

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

rm -rf "$(pyenv root)/plugins/pyenv-virtualenv"
git clone https://github.com/pyenv/pyenv-virtualenv.git \
	$(pyenv root)/plugins/pyenv-virtualenv

mkdir ${workon_home}
eval "$(pyenv virtualenv-init -)"
export WORKON_HOME=${workon_home}
export PROJECT_HOME=${project_home}

rm -rf "$(pyenv root)/plugins/pyenv-virtualenvwrapper"
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git \
	$(pyenv root)/plugins/pyenv-virtualenvwrapper

pyenv install 2.7.11
pyenv install 3.4.4

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.4.4 neovim3

echo -e "\n# Neovim init config\nif [ -f ${wd}/bashrc-ext ]; then\n\tsource ${wd}/bashrc-ext\nfi" >> ~/.bashrc
