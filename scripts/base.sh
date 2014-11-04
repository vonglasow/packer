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
