# 分支

本地分支和远程分支的映射关系
----------------------
`git branch -vv` 查看本地分支和远程分支的映射关系<br>
`git branch -u origin/remoteBranch` 建立本地分支和远程分支的映射关系

> **注意**：
 `git checkout -b localBranch origin/remoteBranch` 拉取远程分支并切换到本地分支，**本地和远程存在映射关系**<br>
 `git fetch origin remoteBranch:localBranch` 拉取远程分支并创建本地分支，**本地和远程没有映射关系**

其他
-----
`git branch -d localBranch` 删除本地分支（`git branch -D localBranch`即使没有merge也删除本地分支）
