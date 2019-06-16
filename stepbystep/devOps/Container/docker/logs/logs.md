# log

logging driver
---------------

|Driver|Description|
|------|-----------|
|none|不显示容器日志|
|json-file|默认日志驱动，`/var/lib/docker/containers/<containerID>/<containerID>-json.log`|
|syslog|linux上日志管理服务|
|journald|linux上日志管理服务|
|gelf|开源日志管理方案|
|fluentd|开源日志管理方案|
|awslogs|第三方日志托管服务|
|splunk|第三方日志托管服务|
|etwlogs||
|gcplogs|第三方日志托管服务|
