sudo chsh -s /usr/bin/zsh
sudo apt-get update
sudo apt-get install -y aptitude

sudo aptitude install -y git \
                        curl \
                        vim \
                        htop \
                        autoconf \
                        bison \
                        gcc \
                        make \
                        linux-headers-$(uname -r) \
                        locate

sudo aptitude install -y libxml2-dev \
                        libgmp-dev \
                        libxslt-dev \
                        libcurl4-openssl-dev \
                        libbz2-dev \
                        libenchant-dev \
                        libpng-dev \
                        libjpeg-dev \
                        libc-client-dev \
                        firebird-dev \
                        libicu-dev \
                        libmcrypt-dev \
                        freetds-dev \
                        pkg-config \
                        unixodbc-dev \
                        libpspell-dev \
                        libpq-dev \
                        libtidy-dev

sudo updatedb

sudo ln -s /usr/lib/x86_64-linux-gnu/libldap_r.so /usr/lib/libldap_r.so
sudo ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so
sudo ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/libsybdb.so

sudo mkdir /usr/local/incl
sudo ln -s /usr/include/sqlext.h /usr/local/incl/sqlext.h

git clone https://github.com/php/php-src.git ~/php-src
cd ~/php-src

git checkout -b PHP-5.6.3 origin/PHP-5.6.3

./buildconf --force
./configure --enable-mbstring --with-openssl --enable-zip
make
sudo make install
