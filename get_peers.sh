#!/usr/bin/env bash
chainCommand="ssdcoin"

#TODO - Retrieve dynamically
chainPort="29444"
connections=$($chainCommand show -c)
availablePeers=$(echo $connections | grep FULL_NODE | grep -v "127\.0\.0\.1" | awk ' { print $2 } ')

echo "$availablePeers" | while read pepe
do
        nc -z $pepe $chainPort
        isForwarded=$?
        if [ "$isForwarded" == "0" ]; then
                echo "$chainCommand show -a ${pepe}:${chainPort}"
        fi
done
