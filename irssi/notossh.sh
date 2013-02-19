#!/bin/bash
/usr/bin/python /usr/local/bin/notossh -H localhost -P 4222 start

curdir=`dirname $0`
/usr/bin/python "$curdir"/workstation_listen.py > ~/.text-notify.log 2>&1 &
