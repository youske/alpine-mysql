#!/bin/sh -e
[ "$1" = 'mysqld_safe' ] && { chown -R mysql . ; exec gosu mysql "$@" ; } || :
[ "$1" = 'bash' ] && { chown -R root . ; exec gosu root "$@" ; } || :
exec "$@"
