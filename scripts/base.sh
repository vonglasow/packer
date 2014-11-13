#!/bin/bash
# Hoa
sudo git clone \
http://git.hoa-project.net/Central.git \
/usr/local/lib/Hoa.central
sudo ln -s \
/usr/local/lib/Hoa.central/Hoa \
/usr/local/lib/Hoa
sudo ln -s \
/usr/local/lib/Hoa/Core/Bin/hoa \
/usr/local/bin/hoa

# Composer
curl -sS \
    https://getcomposer.org/installer | \
sudo php -- --install-dir /usr/local/lib
sudo ln -s \
    /usr/local/lib/composer.phar \
    /usr/local/bin/composer

sudo git clone \
https://github.com/atoum/atoum /usr/local/share/atoum
sudo ln -s \
/usr/local/share/atoum/bin/atoum /usr/local/bin/atoum
cd /usr/local/share/atoum
sudo git checkout -b extension origin/extension

sudo git clone \
https://github.com/hoaproject/Contributions-Atoum-PraspelExtension.git \
/usr/local/lib/atoum-praspel

sudo echo 'declare -x HOA_ATOUM_PRASPEL_EXTENSION=/usr/local/lib/atoum-praspel/' >> ~/.profile

git clone --recursive https://github.com/vonglasow/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

touch ~/.zshrc

#zsh
#
#setopt EXTENDED_GLOB
#rm -f ~/.zshrc
#
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

