#!/bin/sh

cd /home/teeworlds/ddheaven

./local-changes/servers.py
./local-changes/flexnames.py
./local-changes/ddrace_config.py
./local-changes/mysql_config.py

rsync --exclude .git --exclude .gitignore /home/teeworlds/ddheaven /home/teeworlds/servers
