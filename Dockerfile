# Image based in CentOS
FROM centos:latest

# System update
RUN yum update -y

# Install NODE & GIT
RUN curl --silent --location https://rpm.nodesource.com/setup_7.x | bash - && \
    yum install -y nodejs git-all

# Install PHP 7.0 & Libraries
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum install -y \
    php70w \
    php70w-cli \
    php70w-common \
    php70w-bcmath \
    php70w-dba \
    php70w-devel \
    php70w-embedded \
    php70w-gd \
    php70w-imap \
    php70w-interbase \
    php70w-intl \
    php70w-ldap \
    php70w-mbstring \
    php70w-mcrypt \
    php70w-pgsql \
    php70w-mysql \
    php70w-odbc \
    php70w-opcache \
    php70w-pdo \
    php70w-pdo_dblib \
    php70w-process \
    php70w-pspell \
    php70w-recode \
    php70w-tidy \
    php70w-xml \
    php70w-xmlrpc

# Clear packages
RUN yum clean all

# Install PHPUnit
RUN curl -L https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/bin/phpunit && \
    ln -s /usr/bin/phpunit /usr/local/bin/phpunit

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    chmod +x composer.phar && \
    mv composer.phar /usr/bin/composer && \
    ln -s /usr/bin/composer /usr/local/bin/composer

# Install NODE Dependencies
RUN npm install -g gulp gulp-cli cross-env grunt
