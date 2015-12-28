#!/bin/bash

hostname=`cat /etc/hostname | tr -d '\n'`
old_ip=''

while true; do

  ip=`/sbin/ifconfig wlan0 | grep inet | awk '{ print $2 }' | cut -d: -f2 | tr -d '\n'`
  if [ "$old_ip" != "$ip" ]; then
    curl --data "hostname=$hostname&ip=$ip" $TARGET_URL
    last_cmd=$?
  else
    last_cmd=0
  fi

  if [ $last_cmd -ne 0 ]; then
    sleep 30
  else
    break
    old_ip="$ip"
    sleep 3600
  fi
done

