# monitoring setup

### Alert Manager and Prometheus

```
docker run -d --name=alerts-prometheuz -p 9093:9093 \
    -v ${PWD}/alertmanager.yml:/etc/alertmanager/alertmanager.yml \
    quay.io/prometheus/alertmanager

docker run -d --name prometheuz -p 9090:9090 \
    --link alerts-prometheuz \
    --user "$(id -u):$(id -g)" \
    -v ${PWD}/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v ${PWD}/moisture.rules:/etc/prometheus/moisture.rules \
    -v ${HOME}/prometheuz_data:/prometheus:z \
    quay.io/prometheus/prometheus

docker run -it --name noderedhooks -p 1880:1880 \
    --net=host --user "$(id -u):$(id -g)" \
    -v $HOME/projects/miflora-sensors/node-red:/data \
    nodered/node-red

```

### Grafana
```
docker run -d -p 3000:3000 --name grafana grafana/grafana
```


