#!/bin/bash
## KEY - DO NOT CHANGE !

# Label    =  Mac Address
# -------- = ---------------
# sensor A = C4:7C:8D:6B:D6:51
# sensor B = C4:7C:8D:6C:3A:53
# sensor C = C4:7C:8D:6C:3E:8C
# sensor I = C4:7C:8D:6C:53:33

# sensor D = C4:7C:8D:6C:39:25
# sensor E = C4:7C:8D:6C:3E:06
# sensor F = C4:7C:8D:6C:3E:76

# sensor G = C4:7C:8D:6C:57:61
# sensor H = C4:7C:8D:6C:57:CE

# sensor J = C4:7C:8D:6C:56:E5
# sensor K = C4:7C:8D:6C:59:DC


# livingroompi
nohup ./forever.sh C4:7C:8D:6B:D6:51 6000 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3E:8C 6001 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3A:53 6002 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:53:33 6003 >> exporter.log &

# bedroompi
nohup ./forever.sh C4:7C:8D:6C:3E:06 6011 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:3E:76 6012 >> exporter.log &

# babyroompi
nohup ./forever.sh C4:7C:8D:6C:57:61 6020 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:57:CE 6021 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:39:25 6022 >> exporter.log &

# spareroompi
nohup ./forever.sh C4:7C:8D:6C:56:E5 6030 >> exporter.log &
nohup ./forever.sh C4:7C:8D:6C:59:DC 6031 >> exporter.log &
