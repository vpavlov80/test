#!/bin/bash
c=1
	time3=$(date +"%s")
	count=0;
while [ $c -le $2 ]
do
	time1=$(date +"%s")
	time2=86400
	diff1=$(($time1-$time2))
	if [ "$1" = "FIXEDCSV" ]
	then
	cat /tmp/testcsv/data.csv | sed -e 's/1396986124/'`date +%s`'/g' > /opt/canary/`date +%s`.txt
	sleep 1
fi
	
	if [ "$1" = "DELAY" ]
	then
	cat /tmp/testcsv/data.csv | sed -e 's/1396986124/'$diff1'/g' > /opt/canary/`date +%s`.txt
	sleep 1
fi

	if [ "$1" = "NOFILE" ]
	then
	touch /opt/canary/`date +%s`.txt
	sleep 1
	fi

	(( c++ ))

	if [ "$1" = RAMBACKED ]
	then
	count=$((count+1))
	newtime=$((time3-count))
	cat /tmp/testcsv/data.csv | sed -e 's/1396986124/'$newtime'/g' > /dev/shm/ramtest/`date +%s%N`.txt
	sleep 0.01
fi

done
