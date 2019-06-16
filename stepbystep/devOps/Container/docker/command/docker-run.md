# docker run

* `--privileged` 使Container内的root拥有真正的root权限（否则root只是外部一个普通用户权限）Container可以查看很多host上设备，可执行mount，甚至允许在docker容器中启动docker容器。
* `--restart no` Container退出后重启策略

* `--log-driver string`
* `--log-opt list`
