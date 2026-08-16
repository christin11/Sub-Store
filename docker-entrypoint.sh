#!/bin/sh
set -e

echo "Listing backend directory:"
ls -la .

if [ -f ./dist/index.js ]; then
  echo "Start: dist/index.js"
  exec node ./dist/index.js
elif [ -f ./sub-store.min.js ]; then
  echo "Start: sub-store.min.js"
  exec node ./sub-store.min.js
elif [ -f ./index.js ]; then
  echo "Start: index.js"
  exec node ./index.js
else
  echo "No entry file found in /app/backend"
  echo "Files:"
  ls -la
  exit 1
fi
