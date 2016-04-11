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

RUN mkdir -p ${MYSQL_DIR} && chown -R mysql:mysql ${MYSQL_DIR} && \
    cd ${MYSQL_DIR} && mysql_install_db --datadir=${MYSQL_DIR} --user=mysql

COPY my.cnf.tmpl /etc/mysql/my.cnf.tmpl

EXPOSE 3306

WORKDIR ${MYSQL_DIR}
ENTRYPOINT ["render","/etc/mysql/my.cnf","--","switch","shell=/bin/bash","--","mysqld_safe"]
