# 安装

1. 安装Exporter
* 安装Node Export（收集主机和操作系统数据）
`docker run -d -p 9100:9100 -v /proc:/host/proc -v /sys:/host/sys -v /:/rootfs --network=host prom/node-exporter --path.procfs=/host/proc --path.sysfs=/host/sys --collector.filesystem.ignored-mount-points="^/(sys|proc|dev|host|etc)($|/)"`<br>
访问验证：`curl localhost:9100/metrics`<br>

* 安装cAdvisor（收集容器数据）
`docker run -v /:/rootfs:ro -v /var/run:/var/run:rw -v /sys:/sys:ro -v /var/lib/docker:/var/lib/docker:ro -p 8080:8080 -d --name=cadvisor --network=host google/cadvisor:latest`
访问验证：`curl localhost:8080/metrics`

2. 运行Prometheus server
`docker run -d -p 9090:9090 -v /root/prometheus.yaml:/etc/prometheus/prometheus.yml --name prometheus --network=host prom/prometheus`

```
# prometheus.yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s
  external_labels:
    monitor: 'codelab-monitor'
rule_files:

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9100','192.168.183.129:9100','localhost:9090','localhost:8080','192.168.183.129:9090','192.168.183.141:8080']
```
访问验证：`curl localhost:9090/metrics`

3. 运行Grafana
`docker run -d -i -p 3000:3000 -e "GF_SERVER_ROOT_URL=http://grafana.server.name" -e "GF_SECURITY_ADMIN_PASSWORD=secret" --network=host grafana/grafana`<br>
访问验证：`http://[HostIP]:3000`

4. 下载Dashboard，import到Grafana直接使用
