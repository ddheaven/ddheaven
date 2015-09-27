#!/bin/sh

cd /home/teeworlds/ddheaven
#git add .
#git reset local-changes/local_vars.py
#git checkout -- .
#git pull
exit

./local-changes/servers.py
./local-changes/flexnames.py
./local-changes/ddrace_config.py
./local-changes/mysql_config.py

fromdir="/home/teeworlds/ddheaven"
todir="/home/teeworlds/servers"

diff -rq "$fromdir" "$todir" |
while read -r line; do
    mv_from="$(echo "$line" | sed -n "s/.*Files \(.\+\) and \(.\+\) differ.*/\1/p")"
    mv_to="$(echo "$line" | sed -n "s/.*Files \(.\+\) and \(.\+\) differ.*/\2/p")"
    folder="$(echo "$line" | sed -n "s/.*Only in \(.\+\): \(.*\)$/\1/p")"
    file="$(echo "$line" | sed -n "s/.*Only in \(.\+\): \(.*\)$/\2/p")"
    if [ -n "$mv_from" ]; then
        mv "$mv_from" "$mv_to"
    else
        if [ "$folder" = "$fromdir" ]; then
            mv "$fromdir/$file" "$todir/$file"
        else
            rm -r "$todir/$file"
        fi
    fi
done


cd /home/teeworlds/servers

./local-changes/update-servers.sh
