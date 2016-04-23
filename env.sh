#!/bin/sh

git config --global push.default simple
git config --global core.excludesFile "$PWD/gitignore"
git config --global user.email elogent@users.noreply.github.com
git config --global user.name elogent

apt-get install emacs
ln -fs "$PWD/emacs.el" ~/.emacs.el

rm /etc/apt/sources.list.d/webupd8team-ubuntu-java-*
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer

apt-get install keepassx

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client
