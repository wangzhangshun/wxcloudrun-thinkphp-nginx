#!/bin/sh

# 关闭后台启动，hold住进程
nginx -g 'daemon off;'
redis-server &
