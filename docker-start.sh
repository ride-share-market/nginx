#!/bin/sh

#includes lsb functions
. /lib/lsb/init-functions

# Start cron for needed regular logrotate
CRON=`which cron`
log_daemon_msg "Starting ${CRON}"
$CRON

# Start Nginx
NGINX=`which nginx`
log_daemon_msg "Starting ${NGINX}"
$NGINX
