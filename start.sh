#!/bin/bash

tail -f /root/basex/data/.logs/$(date +%Y-%m-%d).log &
/root/basex/bin/./basexhttp
