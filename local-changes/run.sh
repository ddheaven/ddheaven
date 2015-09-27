#!/bin/sh

cd /home/teeworlds/ddheaven
git pull

./local-changes/copy.sh

cd /home/teeworlds/servers

./local-changes/update-servers.sh
