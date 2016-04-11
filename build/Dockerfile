# Alpine Linux with mysql
# alpine based

FROM youske/alpine-std:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

LABEL com.geeplus.description="alpine mysql image" \
      com.geeplus.role="datastore"

ENV PATH=$PATH \
    LANG=C.UTF-8 \
    MYSQL_DIR=/var/lib/mysql \
    PACKAGE='bash ca-certificates mysql mysql-client' \
    BUILDPACK='wget build-base linux-headers musl-dev git'

RUN apk update --no-cache && apk add ${PACKAGE} --no-cache && apk add ${BUILDPACK} --no-cache -t buildpack

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && \
    cd /var/lib/mysql && mysql_install_db --datadir=/var/lib/mysql --user=mysql

COPY my.cnf.tmpl /etc/mysql/my.cnf.tmpl
COPY entrypoint.sh /docker-entrypoint

EXPOSE 3306

WORKDIR ${MYSQL_DIR}
ENTRYPOINT ["render","/etc/mysql/my.cnf","--","switch","shell=/bin/bash","--","mysqld_safe"]
