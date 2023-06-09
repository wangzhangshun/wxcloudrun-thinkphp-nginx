#!/bin/sh

nginx -g 'daemon off;'
redis-server &
php think swoole &

