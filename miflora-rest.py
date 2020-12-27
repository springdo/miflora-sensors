#!/usr/bin/env python
# encoding: utf-8
import json
import re
from flask import Flask
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

def valid_miflora_mac(
    mac, pat=re.compile(r"C4:7C:8D:[0-9A-F]{2}:[0-9A-F]{2}:[0-9A-F]{2}")
):
    """Check for valid mac adresses."""
    if not pat.match(mac.upper()):
        raise argparse.ArgumentTypeError(
            f'The MAC address "{mac}" seems to be in the wrong format'
        )
    return mac


def poll(mac):
    """Poll data from the sensor."""
    poller = MiFloraPoller(mac, BluepyBackend)
    print("Getting data from Mi Flora")
    data = {"temperature": poller.parameter_value(MI_TEMPERATURE),
            "moisture": poller.parameter_value(MI_MOISTURE),
            "light": poller.parameter_value(MI_LIGHT),
            "conductivity": poller.parameter_value(MI_CONDUCTIVITY),
            "battery": poller.parameter_value(MI_BATTERY)}
    return data

app = Flask(__name__)
@app.route('/sensor/<mac>')
def sensor(mac):
    resp = poll(mac)
    return json.dumps(resp)

@app.route('/all_sensors')
def all_sensors():
    sensors = ["C4:7C:8D:6B:D6:51"]
    allSensorPolls = [poll(n) for n in sensors]
    return json.dumps(allSensorPolls)

app.run(host='0.0.0.0')
