#!/bin/bash

set -eux
printenv

for CONFIG_FILE in database
do
    if [ ! -f "config/${CONFIG_FILE}.yml" ]; then
        cp config/${CONFIG_FILE}.template.yml config/${CONFIG_FILE}.yml
    fi
done

mkdir -p /var/www/blog/tmp/pids
mkdir -p /var/www/blog/tmp/cache
mkdir -p /var/www/blog/tmp/sockets

case $1 in
    blog)
        bundle exec puma -C config/puma.rb
        ;;
    *)
        exec "$@"
        ;;
esac
