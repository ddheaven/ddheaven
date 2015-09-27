# DDHeaven
The DDHeaven project wants to keep the DDRace community alive, which unfortunally lost the most popular DDNet servers. It is heavily based on the work by the previous DDNet developers.

## Setup your own DDHeaven servers
If you want your server to be connected to the DDHeaven master server, get updates on map releases, broadcasts and synchronize ranks you have to talk to a DDHeaven developer.  
[ADD CONTACT INFORMATION]

### Debian
Start by creating a user for all the DDHeaven applications and switch to that user for all the following commands.

    adduser teeworlds
    su teeworlds

Now clone this repository to the users home folder.

    cd ~
    git clone git://github.com/ddheaven/ddheaven.git

##### SQL Setup
First you need a MySQL server installed.

    sudo apt-get install mysql-server

Your server starts automatically. Set a password for the SQL root user and start the SQL prompt:

    mysql -p

[INSERT INSTRUCTIONS TO SYNC DATABASE]

##### Server Setup
Copy `local_vars.py` to the right location.

    cd /home/teeworlds/ddheaven
    cp local_vars.py local-changes/

Edit the file in your favorite editor and configure it, you can find helpful comments above the options. When you configured everything correctly run `local-changes/copy.sh`, which will create `/home/teeworlds/servers`, this may take a while.

    ./local-changes/copy.sh

Finally go to the new folder and run `local-changes/run.sh`.

    cd /home/teeworlds/servers
    ./local-changes/run.sh

You can now start your servers using `run-all.sh`.

    ./run-all.sh

You can stop your servers like this.

    ./stop-all.sh
