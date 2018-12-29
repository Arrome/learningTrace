
当Git工作区的某个子目录下执行操作的时候，会在工作区目录中依次向上递归查找 .git 目录（即工作区对应的版本库）， .git 所在的目录就是工作区根目录，

文件 .git/index 记录了工作区文件状态（即暂存区的状态）
文件 .git/refs/heads/master 内容为最新提交对象的SHA1
文件 .git/logs/refs/heads/master master分支日志历史记录（追加到文件末尾）
