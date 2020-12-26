## Miflora Sensor Project

Flask app to read values from sensors. 

```bash
pip3 install -r requirements
python3 miflora-rest.py 
```

Routes available (curl http://localhost:5000):
 - `GET /sensor/<mac_address>` - pass the mac address of a MiFlora
 - `GET /all_sensors` - array of all sensor data

Model returns as: 
```json
{
  "temperature": 22.6,
  "moisture": 5,
  "light": 154,
  "conductivity": 140,
  "battery": 100
}
```

