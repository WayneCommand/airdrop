#!/bin/bash

# start server 10000
nginx
echo 'web server started!'

if [ "$1" = "version" ]; then
  echo 'wayne airdrop 1.0'
else
  cd /app/snapdrop/server; node index.js
fi