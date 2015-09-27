#!/usr/bin/python
from local_vars import *

with open("mysql.cfg") as configfile:
    config = configfile.read()

config = config.replace("SQLPASSWORD", SQLPASSWORD)
config = config.replace("SRVCOUNTRY", SRVCOUNTRY)

with open("mysql.cfg", "w") as configfile:
    configfile.write(config)
