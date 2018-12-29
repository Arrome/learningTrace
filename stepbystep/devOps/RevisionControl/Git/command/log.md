# GIT 日志

log
-----
`git log` 显示所有提交过的版本信息<br>
`git log --pretty=oneline` 获取简单信息<br>
`git log --pretty=raw` 获取详细信息<br>
`git log -p` -p 按补丁格式显示每个更新之间的差异。
`git log --stat` --stat 显示每次更新的文件修改统计信息

reflog
--------
`git reflog` 查看所有分支的所有操作记录（包括已经被删除的commit记录和reset的操作），`git log`无法查看被删除的commitID. <br>
> `git reflog` 查看的是HEAD头指针的变迁记录，而非master分支

`git reflog show master` <br>

>`<refname>@{<n>} 这个表达式的含义是引用<refname>之前第<n>次改变时的SHA1哈希值`
