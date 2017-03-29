#!/bin/bash

/root/basex/bin/./basexhttp &

#watch for log changes

inotifywait -m /root/basex/data/.logs/ -e create -e moved_to -e modify |
    while read
    do
        tail -f $(ls -1t /root/basex/data/.logs/* | sed q)
    done
