#!/bin/bash

/root/basex/bin/./basexhttp &

#watch for log changes

inotifywait -m /root/basex/data/.logs/ -e create -e moved_to -e modify |
    while true
    do
        tail -F /root/basex/data/.logs/*.log
    done
