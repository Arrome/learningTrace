# 常见报错

* 问题：`Failed at step CHDIR spawning /usr/local/bin/kubelet: No such file or directory`
  解决：查看目录下文件存在，service文件定义的工作区目录(WorkingDirectory)未创建
