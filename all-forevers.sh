#!/bin/bash

# sensor A = C4:7C:8D:6B:D6:51
# sensor B = C4:7C:8D:6C:3A:53
# sensor C = C4:7C:8D:6C:3E:8C


# sensor D = C4:7C:8D:6C:39:25
# sensor E = C4:7C:8D:6C:3E:06
# sensor F = C4:7C:8D:6C:3E:76

# livingroompi
nohup ./forever.sh C4:7C:8D:6B:D6:51 6000 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3E:8C 6001 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3A:53 6002 >> exporter.log &

# officepi
nohup ./forever.sh C4:7C:8D:6C:39:25 6010 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3E:06 6011 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3E:76 6012 >> exporter.log &
