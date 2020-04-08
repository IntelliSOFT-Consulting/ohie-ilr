#!/bin/bash

: ${OPENINFOMAN_URL=http://test.cbhipp.intellisoftkenya.com:8984}

export OPENINFOMAN_URL

/utils/replace-vars /var/lib/openinfoman/repo/com/github/openhie/openinfoman/csd_webconf.xqm

# start service
/var/lib/openinfoman/bin/openinfoman > /dev/null 2>&1 &

# start logging
mkdir -p /var/lib/openinfoman/data/.logs/
inotifywait -m /var/lib/openinfoman/data/.logs/ -e modify | \
while read
do
  tail -n1 $(ls -1t /var/lib/openinfoman/data/.logs/* | sed q)
done
