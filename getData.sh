#!/bin/sh

while true
do
wget https://www.yr.no/place/$1/$2/$3/forecast_hour_by_hour.xml -O /root/hourly.xml
/root/jtm /root/hourly.xml |mosquitto_pub  -h $4 -p $5 -u $6 -P $7 -t $8/hourly -s
wget https://www.yr.no/place/$1/$2/$3/forecast.xml -O /root/6hour.xml
/root/jtm /root/6hour.xml |mosquitto_pub  -h $4 -p $5 -u $6 -P $7 -t $8/6hour -s
sleep $9
done
