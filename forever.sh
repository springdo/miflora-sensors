#!/bin/bash


if [ -z ${1} ]; then
  echo "🤥 No Python3 script found - please pass one 🤥 "
  exit 1
fi

SCRIPT_NAME=${1:=miflora-exporter.py}

run(){
  echo "🏃‍♂️ Running ${SCRIPT_NAME}"
  python3 -u ${SCRIPT_NAME}
}

until run; do
  echo "${SCRIPT_NAME} crashed with exit code $?. Restarting..." >&2
  sleep 2
done
