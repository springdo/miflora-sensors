#!/bin/bash

# SCRIPT_NAME=miflora-exporter.py

if [ -z ${1} ]; then
  echo "🤥 No Python3 script found - please pass one 🤥 "
fi

run(){
  python3 ${1}
}

until ${1}; do
  echo "${1} crashed with exit code $?. Restarting..." >&2
  sleep 2
done
