#!/bin/sh
set -e
mkdir -p /run/squid /var/log/squid /var/spool/squid
chown -R proxy:proxy /run/squid /var/log/squid /var/spool/squid
rm -f /run/squid.pid
exec /usr/sbin/squid -N -f /etc/squid/squid.conf -d 1
