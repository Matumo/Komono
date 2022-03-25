sudo date > /dev/null

start_time=`date +%s%3N`
server_time=`curl http://worldtimeapi.org/api/timezone/Asia/Tokyo.txt | grep ^datetime | cut -d " " -f 2`
end_time=`date +%s%3N`
lag=`echo $(($end_time - $start_time))`
time=`echo $(($(echo $server_time | sed 's/\.//') + $lag))`
lag=`echo $lag | sed 's/\([0-9]\{1,3\}\)$/.\1/'`
time=`echo $time | sed 's/\([0-9]\{1,3\}\)$/.\1/'`

echo "Get Time $server_time"
echo "Lag Time $lag"
echo "Set Time $time"

sudo date -s @"$time"
