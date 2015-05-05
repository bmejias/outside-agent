#!/bin/sh

username=`./get_csv_item.sh $1 username`
password=`./get_csv_item.sh $1 password`
alf_url=`./get_csv_item.sh $1 url`
login_url="${alf_url}/alfresco/service/api/login"

ticket=`curl -G "${login_url}" --data-urlencode "u=${username}" --data-urlencode "pw=${password}" 2> /dev/null | xmllint --xpath '/ticket/text()' -`
echo $ticket
