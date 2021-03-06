# Base image
FROM php:7-fpm

# Update packages list
RUN apt-get --yes update;

# Install GIT
RUN apt-get --yes install git

# Install Midnight commander
RUN apt-get --yes install mc

# Install UNZIP command (required for composer)
RUN apt-get --yes install unzip

# Install nano
RUN apt-get --yes install nano

# Install Composer globally
RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Speed up Composer installations
RUN composer global require hirak/prestissimo

# Install Libxml2 to install Soap PHP extension
RUN apt-get install --yes libxml2-dev

# Install Zlib to install Zip PHP extension
RUN apt-get install --yes zlib1g-dev

# Install some basic php extensions
RUN docker-php-ext-install pdo pdo_mysql gettext mysqli soap zip opcache

# Install xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Install SSH server
RUN apt-get --yes install openssh-server
RUN mkdir /var/run/sshd

# Install supervisor (using easy_install to get latest version and not from 2013 using apt-get)
RUN apt-get install --yes python-setuptools
RUN easy_install supervisor
RUN echo_supervisord_conf > /etc/supervisord.conf
RUN mkdir /etc/supervisor/

# Set up supervisor log and include extra configuration files
RUN sed -i -e "s#logfile=/tmp/supervisord.log ;#logfile=/var/log/supervisor/supervisord.log ;#g" /etc/supervisord.conf
RUN sed -i -e "s#;\[include\]#\[include\]#g" /etc/supervisord.conf
RUN sed -i -e "s#;files = relative/directory/\*.ini#files = /etc/supervisor/conf.d/\*.conf#g" /etc/supervisord.conf

# 
RUN chmod -R 777 /usr/local/etc/php/conf.d/*

# Copy .bashrc file
COPY .bashrc /root/.bashrc

# Copy services script file
COPY start.sh /root/start.sh

# Run services file
CMD ["/bin/bash", "/root/start.sh"]
