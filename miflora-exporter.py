from prometheus_client import start_http_server, Gauge
import random
import time
import sys
from datetime import datetime
from btlewrap import BluepyBackend

from miflora import miflora_scanner
from miflora.miflora_poller import (
    MI_BATTERY,
    MI_CONDUCTIVITY,
    MI_LIGHT,
    MI_MOISTURE,
    MI_TEMPERATURE,
    MiFloraPoller,
)

MAC_ADDRESS = sys.argv[1]
PORT = sys.argv[2]

# things to track
# gTemperature = Gauge('temperature', 'Temperature by the plant')
# gMoisture = Gauge('moisture', 'moisture by the plant')
# gLight = Gauge('light', 'light by the plant')
# gConductivity = Gauge('conductivity', 'light by the plant')
# gBattery = Gauge('battery', 'light by the plant')

# sensor 1 = C4:7C:8D:6B:D6:51
# sensor 2 = C4:7C:8D:6C:3E:8C
# sensor 3 =
# sensor 4 =
# sensor 5 =
# sensor 6 =

SENSOR = Gauge('miflora_primary', 'Sensor Data from MiFlora plant sensor', [
               'resource_type'])

# update metrics every 15s
UPDATE_PERIOD = 15

print("Starting miflora exporter %s on %s" % (MAC_ADDRESS, PORT))
dateTimeObj = datetime.now()
timestampStr = dateTimeObj.strftime("%d-%b-%Y (%H:%M:%S.%f)")
print('Current Timestamp : ', timestampStr)


def process_sensor():
    """Poll data from the sensor."""
    poller = MiFloraPoller(MAC_ADDRESS, BluepyBackend)
    # print("Getting data from Mi Flora")

    SENSOR.labels('temperature').set(poller.parameter_value(MI_TEMPERATURE))
    SENSOR.labels('moisture').set(poller.parameter_value(MI_MOISTURE))
    SENSOR.labels('light').set(poller.parameter_value(MI_LIGHT))
    SENSOR.labels('conductivity').set(poller.parameter_value(MI_CONDUCTIVITY))
    SENSOR.labels('battery').set(poller.parameter_value(MI_BATTERY))


if __name__ == '__main__':
    # Start up the server to expose the metrics.
    start_http_server(int(PORT))
    # Generate some requests.
    while True:
        process_sensor()
        time.sleep(UPDATE_PERIOD)
