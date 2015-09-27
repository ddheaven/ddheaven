#!/usr/bin/python
from local_vars import *
import json

with open("local-changes/types.json") as typesfile:
    types = json.load(typesfile)


with open("local-changes/flexname.template") as templatefile:
    template = templatefile.readline().strip()

template = template.replace("SRVCOUNTRY", SRVCOUNTRY)

for typ, info in types.items():
    flexname = template.replace("SRVTYPENAME", info["name"])
    with open("types/"+typ+"/flexname.cfg", "w") as flexnamefile:
        flexnamefile.write(flexname)
