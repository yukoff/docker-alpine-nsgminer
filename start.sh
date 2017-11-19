#!/bin/sh

if [ -z "${POOL}" -a -n "$1" ]; then
  POOL=$1
fi

if [ -z "${USER}" -a -n "$2" ]; then
  USER=$2
fi

if [ -z "${PASSWORD}" -a -n "$3" ]; then
  PASSWORD=$3
fi

if [ -z "${WORKERS}" ]; then
  if [ -n "$4" ]; then
    WORKERS=$4
  else
    WORKERS=`grep -c ^processor /proc/cpuinfo`
  fi
fi

/nsgminer/bin/nsgminer -T --neoscrypt -o "${POOL}" -u "${USER}" -p "${PASSWORD}"
