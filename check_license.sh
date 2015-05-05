#!/bin/sh

alf_url=`./get_csv_item.sh $1 url`
usage_url="${alf_url}/alfresco/service/api/admin/usage"

ticket=`./get_ticket.sh $1`
curl -G "${usage_url}?alf_ticket=${ticket}" 2> /dev/null > .$1.usage.json
warns=`jshon -e warnings -l < .$1.usage.json`
warnings=`jshon -e warnings < .$1.usage.json`
expiration_time=`jshon -e licenseValidUntil < .$1.usage.json`
expiration_epoch=`expr ${expiration_time} / 1000`
expiration_date=`date --date=@${expiration_epoch}`
rm -f .$1.usage.json

echo "$1\tLicense Valid Until: ${expiration_date}"

if [ ${warns} -gt 0 ]
then
    echo "    Warnings: ${warnings}"
fi
