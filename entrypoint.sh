#!/bin/bash

# start server 10000
service nginx restart
echo 'web server started!'

if [ "$1" = "version" ]; then
  echo 'wayne airdrop 1.0'
else
  cd snapdrop/server; node index.js
fi