#!/usr/bin/python
from local_vars import *
import json
import os
from collections import OrderedDict

with open("local-changes/types.json") as typesfile:
    types = json.load(typesfile, object_pairs_hook=OrderedDict)


with open("local-changes/config.template") as templatefile:
    template = templatefile.read().strip()

for filename in os.listdir("servers"):
    os.remove("servers/"+filename)

typ_index = 0
rate = types.values()[0]["rate"]
for index in range(SRVCOUNT):
    port = str(SRVSTARTPORT + index)
    typ, typinfo = types.items()[typ_index]
    if (index+1) / rate >= SRVCOUNT:
        typ_index += 1
        rate += types.values()[typ_index]["rate"]
    config = template.replace("SRVPORT", port)
    config = config.replace("SRVTYPE", typ)
    config = config.replace("SRVSTARTMAP", typinfo["startmap"])
    with open("servers/"+port+".cfg", "w") as configfile:
        configfile.write(config)
