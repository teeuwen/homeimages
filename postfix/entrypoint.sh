#!/bin/sh

mkdir -p /var/lib/postfix
chown postfix:postfix /var/lib/postfix

mkdir -p /var/spool/postfix
chown root:root /var/spool/postfix

exec /usr/sbin/postfix start-fg
