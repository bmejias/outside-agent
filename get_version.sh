#!/bin/sh

username=`./get_csv_item.sh $1 username`
password=`./get_csv_item.sh $1 password`
alf_url=`./get_csv_item.sh $1 url`
api_url="${alf_url}/alfresco/service/api"
login_url="${api_url}/login"
server_data_url="${api_url}/server"

ticket=`curl -G "${login_url}" --data-urlencode "u=${username}" --data-urlencode "pw=${password}" 2> /dev/null | xmllint --xpath '/ticket/text()' -`
result=`curl -G "${server_data_url}?alf_ticket=${ticket}" 2> /dev/null | jshon -e data -e version -`
echo "$1\t${result}"

