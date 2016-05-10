#!/bin/sh

# Copy MySQL conf files into valid directory - it does the trick with 777 permissions on Windows hosts
#chmod -R 777 /etc/mysql/conf.d/*
#chown -R root:root /etc/mysql/conf.d/*
#cp /etc/mysql/conf.d/source/* /etc/mysql/conf.d/

# Set timezone
export TZ="Europe/Warsaw"

/entrypoint.sh mysqld



