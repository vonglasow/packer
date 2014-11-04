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
                        php5 \
                        php5-cli \
                        php5-fpm

sudo aptitude install -y libxml2-dev \
                        libgmp-dev \
                        libcurl4-openssl-dev \
                        pkg-config \
                        libbz2-dev \
                        libenchant-dev \
                        libpng-dev \
                        libjpeg-dev \
                        libc-client-dev \
                        firebird-dev \
                        libicu-dev \
                        libmcrypt-dev \
                        freetds-dev

sudo ln -s /usr/lib/x86_64-linux-gnu/libldap_r.so /usr/lib/libldap_r.so
sudo ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so
sudo ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/libsybdb.so

git clone https://github.com/php/php-src.git ~/php-src
cd ~/php-src
./buildconf
./configure --enable-all --with-kerberos --with-imap-ssl --prefix=/opt/php7
make
make install
