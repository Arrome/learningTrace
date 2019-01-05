# k8s节点网络搭建

下载flannel包：`wget https://github.com/coreos/flannel/releases/download/v0.10.0/flannel-v0.10.0-linux-amd64.tar.gz`<br>

方式一：配置flannel服务
------------------
1. `cp {flanneld,mk-docker-opts.sh} /usr/local/kubernetes/bin/`
2. 配置文件/usr/local/kubernetes/config/flanneld.conf
```
FLANNEL_ETCD="http://192.168.42.51:2379"
FLANNEL_ETCD_KEY="/atomic.io/network"
FLANNEL_OPTIONS="--iface=ens33"
```
3. 配置服务文件/usr/lib/systemd/system/flanneld.service
```
[Unit]
Description=Flanneld overlay address etcd agent
After=network.target
After=network-online.target
Wants=network-online.target
After=etcd.service
Before=docker.service

[Service]
Type=notify
EnvironmentFile=/usr/local/kubernetes/config/flanneld.conf
EnvironmentFile=-/etc/sysconfig/docker-network
ExecStart=/usr/local/kubernetes/bin/flanneld \
  -etcd-endpoints=${FLANNEL_ETCD} \
  -etcd-prefix=${FLANNEL_ETCD_KEY} \
  $FLANNEL_OPTIONS
ExecStartPost=/usr/local/kubernetes/bin/mk-docker-opts.sh \
  -k DOCKER_NETWORK_OPTIONS \
  -d /run/flannel/docker
Restart=on-failure

[Install]
WantedBy=multi-user.target
RequiredBy=docker.service
```
> mk-docker-opts.sh 脚本将分配给 flanneld 的 Pod 子网网段信息写入 /run/flannel/docker 文件,子网信息写入 /run/flannel/subnet.env 文件，后续 docker 启动时使用这个文件中的环境变量配置 docker0 网桥；<br>
> flanneld 使用系统缺省路由所在的接口与其它节点通信，对于有多个网络接口（如内网和公网）的节点，可以用 -iface 参数指定通信接口 <br>
> flanneld 运行时需要 root 权限

4. 在etcd集群里设置
* `etcdctl mkdir /atomic.io/network`
* `etcdctl mk /atomic.io/network/config  "{ \"Network\": \"172.17.0.0/16\", \"SubnetLen\": 24, \"Backend\": { \"Type\": \"vxlan\" } }" { "Network": "172.17.0.0/16", "SubnetLen": 24, "Backend": { "Type": "vxlan" } }`
5. docker服务文件/usr/lib/systemd/system/docker.service配置flannel
```
[Unit]
Description=Docker Application Container Engine
Documentation=http://docs.docker.com
After=network.target docker.socket
[Service]
Type=notify
EnvironmentFile=-/run/flannel/subnet.env
EnvironmentFile=-/run/flannel/docker
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/dockerd \
  -H tcp://0.0.0.0:4243 \
  -H unix:///var/run/docker.sock \
  --selinux-enabled=false \
  --log-opt max-size=1g
ExecReload=/bin/kill -s HUP
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
#TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process
Restart=on-failure
[Install]
WantedBy=multi-user.target
```
> 配置中加入 EnvironmentFile=-/run/flannel/subnet.env,EnvironmentFile=-/run/flannel/docker
6. 依次启动flannel和docker
7. `ip add` 确认flannel生成ip和docker0在同一网段内,<br>
  `ping xxx.xxx.xxx.0` ping网段，确认是否连通
