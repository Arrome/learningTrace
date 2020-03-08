# 节点

角色相关labels：
```
node-role.kubernetes.io/master: ""  # 机器角色
kubernetes.io/hostname: master      # nodename 默认获取主机hostname
```

taint && toleration(污点--容忍)
------------------
[官方参考](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/):`https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/`

* 添加taint:`kubectl taint nodes node1 xxxxx:NoSchedule`
* 删除taint：`kubectl taint nodes node1 xxxx:NoSchedule-`
