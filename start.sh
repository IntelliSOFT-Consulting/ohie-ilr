#!/bin/bash

/root/basex/bin/./basexhttp &
sleep 1s
tail -F /root/basex/data/.logs/*.log
