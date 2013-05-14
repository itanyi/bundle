#!/bin/bash
# Author: tanyi@wandoujia.com
# Created Time:05/14/13 10:27:25
git submodule init
git submodule update
if [ -d ~/.vim ];then
    rm -rf ~/.vim.bak
    mv ~/.vim ~/.vim.bak
fi
if [ -f ~/.vimrc ];then
    rm -f ~/.vimrc.bak
    mv ~/.vimrc ~/.vimrc.bak
fi
cp -rf .vim ~/
cp .vimrc ~/        
