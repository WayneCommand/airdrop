#!/bin/bash

# setting permission.
chown -R ${PUID}:${PGID} /app/airdrop
umask ${UMASK}

# start server 10000
service nginx restart
echo 'web server started!'

if [ "$1" = "version" ]; then
  echo 'wayne airdrop 1.0'
else
#  exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
  cd /app/airdrop/server; node index.js
fi