# merge

从指定commitId合并到当前分支(与当前分支直接合并)操作
> 注意：本地更改未提交到本地仓库，merge会报错

![git merge](../images/git-merge.jpg)

远程合并到本地分支
---------------
方式一：从远程获取到本地临时分支（`git fetch origin master：masterTmp`），然后查看版本差异（`git diff masterTmp`），合并临时版本到本地分支（`git merge masterTmp`），删除本地分支（`git branch -D masterTmp`）<br>
方式二：从远程获取最新版本（`git fetch origin master`），查看版本差异（`git log -p master..origin/master`）,合并最新代码到本地（`git merge origin/master`）


合并问题解决
-------------
远程合并到本地，auto-merge失败：<br>
1. 丢掉本地：`git reset --hard origin/master`
2. 手动修改本地冲突文件，然后提交修改：
