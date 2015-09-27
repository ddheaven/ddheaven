#!/bin/bash

handle_term() {
  kill "$child" 2>/dev/null
  exit
}

trap handle_term SIGHUP SIGINT SIGTERM

while true; do
  mv servers/$1.log servers/$1.log.old
  nice -n -15 ./DDNet-Server_sql -f servers/$1.cfg &
  child=$!
  wait "$child"
  sleep 1
done
