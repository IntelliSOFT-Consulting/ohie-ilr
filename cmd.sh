#!/bin/bash

: ${OPENINFOMAN_URL=http://localhost:8984}

export OPENINFOMAN_URL

/utils/replace-vars /var/lib/openinfoman/repo/com/github/openhie/openinfoman/csd_webconf.xqm

#start service with logs
/var/lib/openinfoman/bin/basexhttp
