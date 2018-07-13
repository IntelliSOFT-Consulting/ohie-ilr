#!/bin/bash

: ${OPENINFOMAN_URL=http://localhost:8984}

export OPENINFOMAN_URL

/utils/replace-vars /var/lib/openinfoman/repo/com/github/openhie/openinfoman/csd_webconf.xqm

# start logging
tail -f $(ls -1t /var/lib/openinfoman/data/.logs/* | sed q) &
# start service
/var/lib/openinfoman/bin/openinfoman > /dev/null 2>&1
