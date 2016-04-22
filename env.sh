#!/bin/sh

git config --global push.default simple
git config --global core.excludesFile "$PWD/gitignore"
git config --global user.email elogent@users.noreply.github.com
git config --global user.name elogent

apt-get install emacs
rm ~/.emacs.el
ln -s "$PWD/emacs.el" ~/.emacs.el

apt-get install keepassx
