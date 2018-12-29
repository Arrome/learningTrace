# rebase

使分支历史看起来没有经过合并一样（会把分支里的每个提交取消掉，临时保存为补丁，保存到.git/rebase目录，然后把当前分支更新为远程最新分支，然后把保存的补丁应用到当前分支）

![git rebase](../images/git-rebase.jpg)

`git rebase origin/master` <br>
`git rebase --abort` 终止rebase合并行动，分支回到rebase开始前的状态
`git rebase --continue`
