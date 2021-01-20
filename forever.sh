#!/bin/bash


if [ -z ${1} ]; then
  echo "🤥 No Mac Address or Port found - please pass them 🤥 "
  exit 1
fi

SCRIPT_NAME="miflora-exporter.py"
MAC_ADDRESS=${1:="C4:7C:8D:6C:3E:8C"}
PORT=${2:="6000"}

run(){
  echo "🏃‍♂️ Running ${SCRIPT_NAME} ${MAC_ADDRESS} ${PORT}"
  python3 -u ${SCRIPT_NAME} ${MAC_ADDRESS} ${PORT}
}

until run; do
  echo "${SCRIPT_NAME} ${MAC_ADDRESS} ${PORT} crashed with exit code $?. Restarting..." >&2
  sleep 2
done
