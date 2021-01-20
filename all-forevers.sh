#!/bin/bash

# sensor 1 = C4:7C:8D:6B:D6:51
# sensor 2 = C4:7C:8D:6C:3E:8C
# sensor 3 =
# sensor 4 =
# sensor 5 =
# sensor 6 =

nohup ./forever.sh C4:7C:8D:6B:D6:51 6000 > exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3E:8C 6001 > exporter.log &
