FROM centos:centos6.6

RUN chkconfig --level 0123456 iptables off
RUN echo 0 >/selinux/enforce

RUN yum update -y

RUN yum install ntp -y
RUN chkconfig --level 345 ntpd on

RUN yum groupinstall "Development Tools" -y
RUN yum install ncurses-devel nano wget bind-utils bc bluez bluez-libs usbutils pygobject2 dbus-python telnet supervisor -y

RUN wget http://nginx.org/download/nginx-1.9.3.tar.gz -O /usr/src/nginx-1.9.3.tar.gz

RUN yum install tar git lua lua-devel pcre-devel openssl-devel -y

RUN cd /usr/src/; \ 
tar -zxvf nginx-1.9.3.tar.gz

RUN git clone https://github.com/simpl/ngx_devel_kit.git /usr/src/ngx_devel_kit
RUN git clone https://github.com/openresty/echo-nginx-module.git /usr/src/echo-nginx-module
RUN git clone https://github.com/openresty/lua-nginx-module.git /usr/src/lua-nginx-module
RUN git clone https://github.com/openresty/redis2-nginx-module.git /usr/src/redis2-nginx-module
RUN git clone https://github.com/openresty/set-misc-nginx-module.git /usr/src/set-misc-nginx-module

RUN cd /usr/src/nginx-1.9.3/;\
./configure --prefix=/opt/nginx --add-module=/usr/src/redis2-nginx-module --add-module=/usr/src/ngx_devel_kit --add-module=/usr/src/set-misc-nginx-module --add-module=/usr/src/echo-nginx-module --add-module=/usr/src/lua-nginx-module  --with-http_ssl_module &&\
make &&\
make install

RUN mkdir /opt/nginx/conf/vhosts/
RUN mkdir -p /var/ftp/wav

RUN cp /opt/nginx/conf/nginx.conf /opt/nginx/conf/nginx.conf.orig
COPY httpd-conf/sounds.conf /opt/nginx/conf/vhosts/
COPY httpd-conf/nginx.conf /opt/nginx/conf/

COPY bashrc-add-conf/bashrc-additional.conf /tmp/
RUN cat /tmp/bashrc-additional.conf >> /etc/bashrc

EXPOSE 81
CMD ["/opt/nginx/sbin/nginx"]
