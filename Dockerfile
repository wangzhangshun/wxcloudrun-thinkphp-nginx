FROM leekay0218/crmeb-pro

# 安装依赖包，如需其他依赖包，请到alpine依赖包管理(https://pkgs.alpinelinux.org/packages?name=php8*imagick*&branch=v3.13)查找。
# 选用国内镜像源以提高下载速度
RUN apt-get update
RUN apt-get install --reinstall ca-certificates
RUN apt-get -y install nginx
RUN apt-get -y install telnet
RUN apt-get -y install procps

## 复制代码
ADD ./ /var/www

# 设置容器启动后的默认运行目录
WORKDIR /var/www

# 替换nginx配置
RUN cp /var/www/nginx.conf /etc/nginx/conf.d/default.conf \
    && mkdir -p /run/nginx \
    && chmod -R 777 /var/www/runtime

RUN rm /etc/nginx/sites-enabled/default
# 默认入口命令
ENTRYPOINT ["/entrypoint.sh"]
RUN chmod 700 /var/www/run.sh
ENTRYPOINT ["/var/www/run.sh"]

EXPOSE 80