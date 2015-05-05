#!/bin/sh

alf_url=`./get_csv_item.sh $1 url`
api_url="${alf_url}/alfresco/service/api"
server_data_url="${api_url}/server"

ticket=`./get_ticket.sh $1`
result=`curl -G "${server_data_url}?alf_ticket=${ticket}" 2> /dev/null | jshon -e data -e version -`
echo "$1\t${result}"
