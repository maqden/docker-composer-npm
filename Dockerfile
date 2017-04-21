FROM debian

MAINTAINER rdehnhardt <renatotkd@gmail.com>

RUN echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list && \
    echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list && \
    apt-get update -y && apt-get install -y wget && \
    wget https://www.dotdeb.org/dotdeb.gpg && \
    apt-key add dotdeb.gpg && \
    apt-get update -y && \
    apt-get install -y \
        ca-certificates \
        node \
        npm \
        php7.0 \
        php7.0-common \
        php7.0-json \
        php7.0-cli \
        php7.0-mcrypt \
        php7.0-sqlite3 \
        php7.0-zip \
        curl \
        git \
        python-dev \
        python-pip \
        zlib1g-dev && \
    pip install awscli && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    npm install -g bower gulp grunt && \
    mv composer.phar /usr/bin/composer

VOLUME /var/www