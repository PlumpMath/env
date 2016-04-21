#!/bin/sh

git config --global core.excludesFile "$PWD/gitignore"

rm ~/.emacs.el
ln -s "$PWD/emacs.el" ~/.emacs.el
