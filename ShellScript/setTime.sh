#!/bin/bash
sudo date > /dev/null
start_time=`date +%s.%3N`
server_time=`wget -q https://ntp-a1.nict.go.jp/cgi-bin/jst -O - | sed -n 4p`
end_time=`date +%s.%3N`
lag=`echo "scale=3; ($end_time - $start_time)/2.0" | bc`
time=`echo "scale=3; $server_time + $lag" | bc`
echo "Get Time $server_time"
echo "Lag Time $lag"
echo "Set Time $time"
sudo date -s @"$time"
