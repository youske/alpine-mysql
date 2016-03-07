# Alpine Linux with mysql
# alpine based

FROM alpine
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PATH=$PATH \
    LANG=C.UTF-8 \
    GOSU=https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
    MYSQL_DIR=/var/lib/mysql \
    APKINSTALL='bash wget mysql'

RUN adduser -D -h /home/admin -s /bin/bash admin admin && \
    apk add --no-cache ${APKINSTALL} && \
    wget -q --no-check-certificate -O /usr/local/bin/gosu ${GOSU} && \
    chmod +x /usr/local/bin/gosu

#RUN addgroup -S mysql && adduser -S -G mysql mysql && \
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && \
    cd /var/lib/mysql && mysql_install_db --datadir=/var/lib/mysql --user=mysql

#COPY my.cnf /etc/mysql/my.cnf
COPY entrypoint.sh /docker-entrypoint

ENTRYPOINT ["/docker-entrypoint"]
WORKDIR ${MYSQL_DIR}
#CMD ["mysqld_safe"]
CMD ["bash"]

EXPOSE 3306
