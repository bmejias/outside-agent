#!/bin/sh

ticket=`./get_ticket.sh $1`
echo "$1\t${ticket}"
