#!/bin/sh

host_ip=`./get_ip.sh $1`
result=`(ping -c 1 $host_ip | grep "time=") || echo "$1 failed"`
echo "$1\t$result"
