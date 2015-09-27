#!/bin/sh

# This file is called when the git repo updated.

cd /home/teeworlds/ddheaven

git add local-changes/local_vars.py
git checkout .
git config user.name "ddheaven-client"
git stash
git pull origin master
git stash pop

./local-changes/servers.py
./local-changes/flexnames.py
./local-changes/ddrace_config.py
./local-changes/mysql_config.py


copy () {
    file="`basename "$1"`"
    if [ "$file" != ".git" ] && [ "$file" != ".gitignore" ]; then
        if [ "$file" = "local-changes" ]; then
            cp -r "$1" "$2"
        else
            mv "$1" "$2"
        fi
    fi
}

fromdir="/home/teeworlds/ddheaven"
todir="/home/teeworlds/servers"

mkdir -p "$todir"

diff -rq "$fromdir" "$todir" |
while read -r line; do
    mv_from="$(echo "$line" | sed -n "s/.*Files \(.\+\) and \(.\+\) differ.*/\1/p")"
    mv_to="$(echo "$line" | sed -n "s/.*Files \(.\+\) and \(.\+\) differ.*/\2/p")"
    folder="$(echo "$line" | sed -n "s/.*Only in \(.\+\): \(.*\)$/\1/p")"
    file="$(echo "$line" | sed -n "s/.*Only in \(.\+\): \(.*\)$/\2/p")"
    if [ -n "$mv_from" ]; then
        copy "$mv_from" "$mv_to"
    else
        if [ "$folder" = "$fromdir" ]; then
            copy "$fromdir/$file" "$todir/$file"
        else
            rm -r "$todir/$file"
        fi
    fi
done


cd /home/teeworlds/servers

./local-changes/update-servers.sh
