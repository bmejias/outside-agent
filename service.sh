#!/bin/bash

source config_ssh

ip=`./get_csv_item.sh $1 ip`
service_call="'/usr/bin/sudo /usr/sbin/service alfresco $2'"
(ssh -l $OAUSER -i $OAKEY $ip ${service_call} 2> /dev/null) || echo "$1 failed"
