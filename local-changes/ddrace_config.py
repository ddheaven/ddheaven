#!/usr/bin/python
from local_vars import *

with open("ddrace.cfg") as configfile:
    config = configfile.read()

config = config.replace("RCONPASSWORD", RCONPASSWORD)
config = config.replace("RCONMODPASSWORD", RCONMODPASSWORD)

with open("ddrace.cfg", "w") as configfile:
    configfile.write(config)
