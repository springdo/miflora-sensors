# monitoring setup

### Alert Manager and Prometheus

```
docker run --name prometheuz -p 9090:9090 \
    --link alerts-prometheuz \
    -v ${PWD}/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v ${PWD}/example.rules:/etc/prometheus/example.rules \
    -v ${HOME}/prometheuz_data:/prometheus \
    quay.io/prometheus/prometheus -alertmanager.url=http://alerts-prometheuz:9093

docker run -d --name=alerts-prometheuz -p 9093:9093 \
    -v ${PWD}/alertmanager.yml:/etc/alertmanager/alertmanager.yml \
    quay.io/prometheus/alertmanager
```

### Grafana
```
docker run -d -p 3000:3000 --name grafana grafana/grafana
```


