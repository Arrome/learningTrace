# daemonset

特定场景调度：管理集群中**每个Node上仅运行一份Pod**的副本实例。

使用场景：
--------
* 每个Node上运行一个分布式存储的守护进程，例如：glusterFs，ceph
* 每个Node上运行日志采集器，例如：fluentd，logstash
* 每个Node上运行监控的采集端，例如：prometheus Node exporter，collectd，New Relic agent等

> daemonSet.spec.template.spec.hostNetwork 配置使用 宿主机网络
