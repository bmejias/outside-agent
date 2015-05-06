#!/bin/bash

source config_ssh

ip=`./get_csv_item.sh $1 ip`
result=`(ssh -l $OAUSER -i $OAKEY $ip "/usr/bin/sudo -S /sbin/service alfresco $2" 2> /dev/null) || echo "$1 failed"`
echo -e "$1\t${result}"
