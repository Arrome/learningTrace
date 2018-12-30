# daemon.json dockerd默认配置文件
方式一：默认在/etc/docker目录下daemon.json(需要新建)<br>
方式二：通过运行时参数`--config-file`指定,例如：`dockerd --config-file=xxx`<br>
> 注意：重启docker服务使其生效
```
{
	"authorization-plugins": [],
	"data-root": "",       #默认：/var/lib/docker,Docker运行时使用的根路径
	"dns": [],             #设定容器DNS地址，在容器/etc/resolv.conf文件中可查
	"dns-opts": [],        # 容器/etc/resolv.conf文件，其他设置
	"dns-search": [],      # 设定容器的搜索域，若不设置docker默认主机上/etc/resolv.conf
	"exec-opts": [],
	"exec-root": "",
	"experimental": false,
	"features": {},
	"storage-driver": "",
	"storage-opts": [],
	"labels": [],          # docker主机的标签
	"live-restore": true,
	"log-driver": "",
	"log-opts": {},
	"mtu": 0,
	"pidfile": "",         # docker daemon的PID文件
	"cluster-store": "",
	"cluster-store-opts": {},
	"cluster-advertise": "",
	"max-concurrent-downloads": 3,
	"max-concurrent-uploads": 5,
	"default-shm-size": "64M",
	"shutdown-timeout": 15,
	"debug": true,    #启动debug模式，启用后显示更多启动信息，默认false
	"hosts": [],      #设置容器hosts
	"log-level": "",
	"tls": true,       #默认：false，启动TLS认证开关
	"tlsverify": true, #默认：false，使用TLS并做后台进程与客户端通信验证
	"tlscacert": "",   #默认：~/.docker/ca.pem,通过CA认证过的certificate文件路径  
	"tlscert": "",     #默认：~/.docker/cert.pem,TLS的certificate文件路径
	"tlskey": "",      #默认：~/.docker/key.pem,TLS的key文件路径
	"swarm-default-advertise-addr": "",
	"api-cors-header": "",
	"selinux-enabled": false,  # 默认：false，启用selinux
	"userns-remap": "",
	"group": "",               # Unix套接字的属组，仅指/var/run/docker.sock
	"cgroup-parent": "",
	"default-ulimits": {
		"nofile": {
			"Name": "nofile",
			"Hard": 64000,
			"Soft": 64000
		}
	},
	"init": false,
	"init-path": "/usr/libexec/docker-init",
	"ipv6": false,
	"iptables": false,
	"ip-forward": false,   #默认：true，启用net.ipv4.ip_forward=1
	"ip-masq": false,
	"userland-proxy": false,
	"userland-proxy-path": "/usr/libexec/docker-proxy",
	"ip": "0.0.0.0",
	"bridge": "",
	"bip": "",
	"fixed-cidr": "",
	"fixed-cidr-v6": "",
	"default-gateway": "",
	"default-gateway-v6": "",
	"icc": false,        #
	"raw-logs": false,
	"allow-nondistributable-artifacts": [],
	"registry-mirrors": [],        # 镜像加速地址，docker info可查
	"seccomp-profile": "",
	"insecure-registries": [],     # 配置docker私库地址
	"no-new-privileges": false,
	"default-runtime": "runc",
	"oom-score-adjust": -500,
	"node-generic-resources": ["NVIDIA-GPU=UUID1", "NVIDIA-GPU=UUID2"],
	"runtimes": {
		"cc-runtime": {
			"path": "/usr/bin/cc-runtime"
		},
		"custom": {
			"path": "/usr/local/bin/my-runc-replacement",
			"runtimeArgs": [
				"--debug"
			]
		}
	},
	"default-address-pools":[{"base":"172.80.0.0/16","size":24},
	{"base":"172.90.0.0/16","size":24}]
}
```
