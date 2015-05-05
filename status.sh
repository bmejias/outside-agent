#!/bin/bash

source config_ssh

ip=`./get_csv_item.sh $1 ip`
(ssh -l $OAUSER -i $OAKEY $ip '/usr/bin/sudo /usr/sbin/service alfresco status' 2> /dev/null) || echo "$1 failed"
