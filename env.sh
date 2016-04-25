#!/bin/sh

git config --global push.default simple
git config --global core.excludesFile "$PWD/gitignore"
git config --global user.email elogent@users.noreply.github.com
git config --global user.name elogent

sudo apt install emacs
ln -fs "$PWD/emacs.el" ~/.emacs.el

sudo apt install pandoc

sudo rm /etc/apt/sources.list.d/webupd8team-ubuntu-java-*
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer

sudo curl -Lo /usr/local/bin/boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh
sudo chmod +x /usr/local/bin/boot
mkdir ~/.boot
echo BOOT_CLOJURE_VERSION=1.8.0 > ~/.boot/boot.properties
echo BOOT_EMIT_TARGET=no >> ~/.boot/boot.properties
boot -u

sudo apt install keepassx

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client
