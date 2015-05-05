#!/bin/bash

source config_ssh

ip=`./get_csv_item.sh $1 ip`
(ssh -l $OAUSER -i $OAKEY $ip /bin/true 2> /dev/null && echo "$1 success") || echo "$1 failed"
