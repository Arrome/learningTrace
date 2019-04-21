# CGroups

cgroups 实现资源控制,具体控制对资源的分配、优先顺序、拒绝、管理和监控，更好的根据任务和用户分配硬件资源，提高总体效率<br>

查看linux系统CGROUP是否启动：
```
cat /boot/config-`uname -r` | grep CGROUP
```

cgroups控制的资源(`/sys/fs/cgroup`下子系统)：
---------------
* blkio — 这​​​个​​​子​​​系​​​统​​​为​​​块​​​设​​​备​​​设​​​定​​​输​​​入​​​/输​​​出​​​限​​​制​​​，比​​​如​​​物​​​理​​​设​​​备​​​（磁​​​盘​​​，固​​​态​​​硬​​​盘​​​，USB 等​​​等​​​）。
* cpu — 这​​​个​​​子​​​系​​​统​​​使​​​用​​​调​​​度​​​程​​​序​​​提​​​供​​​对​​​ CPU 的​​​ cgroup 任​​​务​​​访​​​问​​​。​​​
* cpuacct — 这​​​个​​​子​​​系​​​统​​​自​​​动​​​生​​​成​​​ cgroup 中​​​任​​​务​​​所​​​使​​​用​​​的​​​ CPU 报​​​告​​​。​​​
* cpuset — 这​​​个​​​子​​​系​​​统​​​为​​​ cgroup 中​​​的​​​任​​​务​​​分​​​配​​​独​​​立​​​ CPU（在​​​多​​​核​​​系​​​统​​​）和​​​内​​​存​​​节​​​点​​​。​​​
* devices — 这​​​个​​​子​​​系​​​统​​​可​​​允​​​许​​​或​​​者​​​拒​​​绝​​​ cgroup 中​​​的​​​任​​​务​​​访​​​问​​​设​​​备​​​。​​​
* freezer — 这​​​个​​​子​​​系​​​统​​​挂​​​起​​​或​​​者​​​恢​​​复​​​ cgroup 中​​​的​​​任​​​务​​​。​​​
* memory — 这​​​个​​​子​​​系​​​统​​​设​​​定​​​ cgroup 中​​​任​​​务​​​使​​​用​​​的​​​内​​​存​​​限​​​制​​​，并​​​自​​​动​​​生​​​成​​​​​内​​​存​​​资​​​源使用​​​报​​​告​​​。​​​
* net_cls — 这​​​个​​​子​​​系​​​统​​​使​​​用​​​等​​​级​​​识​​​别​​​符​​​（classid）标​​​记​​​网​​​络​​​数​​​据​​​包​​​，可​​​允​​​许​​​ Linux 流​​​量​​​控​​​制​​​程​​​序​​​（tc）识​​​别​​​从​​​具​​​体​​​ cgroup 中​​​生​​​成​​​的​​​数​​​据​​​包​​​。​​​
* net_prio — 这个子系统用来设计网络流量的优先级
* hugetlb — 这个子系统主要针对于HugeTLB系统进行限制，这是一个大页文件系统。


docker中cgroups的使用
----------------------
默认，Docker启动容器后，会在`/sys/fs/cgroup`目录下各个资源目录下生成以容器ID为名字的目录group。例如：`/sys/fs/cgroup/cpu/docker/containerId`。docker目录作为一个cpu控制族群，创建后自动建立相关文件。<br>
Docker将容器中的进程ID加入到各个资源对应的tasks文件中，实现cgroups对容器cpu使用限制

#### cpu
* 文件**cpu.cfs_period_us** : cpu分配的周期（微秒）默认：100000
* 文件**cpu.cfs_quota_us** : cgroup限制占用的时间（微秒）默认：-1，表示不限制。若为50000,50000/100000=50%的CPU
* 文件**cpu.shares** : 相对值，cpu不够用时才使用

```
--cpu-period int                 Limit CPU CFS (Completely Fair Scheduler) period
--cpu-quota int                  Limit CPU CFS (Completely Fair Scheduler) quota
--cpu-rt-period int              Limit CPU real-time period in microseconds
--cpu-rt-runtime int             Limit CPU real-time runtime in microseconds
-c, --cpu-shares int             CPU shares (relative weight)
--cpus decimal                   Number of CPUs
--cpuset-cpus string             CPUs in which to allow execution (0-3, 0,1)
```

#### memory

```
--cpuset-mems string             MEMs in which to allow execution (0-3, 0,1)
--kernel-memory bytes            Kernel memory limit
-m, --memory bytes               Memory limit
--memory-reservation bytes       Memory soft limit
--memory-swap bytes              Swap limit equal to memory plus swap: '-1' to enable unlimited swap
--memory-swappiness int          Tune container memory swappiness (0 to 100) (default -1)
--oom-kill-disable               Disable OOM Killer
--oom-score-adj int              Tune host's OOM preferences (-1000 to 1000)
```

#### device

```
--blkio-weight-device list       Block IO weight (relative device weight) (default [])
--device list                    Add a host device to the container
--device-cgroup-rule list        Add a rule to the cgroup allowed devices list
--device-read-bps list           Limit read rate (bytes per second) from a device (default [])
--device-read-iops list          Limit read rate (IO per second) from a device (default [])
--device-write-bps list          Limit write rate (bytes per second) to a device (default [])
--device-write-iops list         Limit write rate (IO per second) to a device (default [])
```

#### blkio

```
--blkio-weight uint16            Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
--blkio-weight-device list       Block IO weight (relative device weight) (default [])
```
