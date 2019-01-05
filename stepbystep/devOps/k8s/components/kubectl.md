# kubectl

kubectl访问集群配置文件：
1. 通过`KUBECONFIG`环境变量指向config文件
2. 从`$HOME/.kube`目录下查找文件名为config的文件（不需要融合）
3. `--kubeconfig`设置config文件(设置一次，不需要融合)

`kubectl config view` 查看kubeconfig文件配置（可能是多个kubeconfig文件融合后结果）<br>

problem
--------
* `kubectl get nodes`发现node是notReady，可能是进程kubelet有问题，`journalctl -f -u kubelet`或者查看进程`systemctl status kubelet`
