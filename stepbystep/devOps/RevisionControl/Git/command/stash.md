# stash

git stash将当前工作区的未提交的修改（暂存的和非暂存的）保存起来（**git stash不会保存工作区新增文件和被忽略的文件，若要保存需要使用 -u[--include-untracked],-a[--all]**），可以随时将某次缓存的修改重新应用到当前工作区


`git stash save "message"` 推荐取代git stash，用message记录版本<br>
`git stash list` 查看所有stash<br>
`git stash pop` 恢复之前缓存的工作目录,删除缓存的stash的记录<br>
`git stash apply` 通过名字指定使用哪个stash，默认使用最近stash（stash@{0}），不删除缓存的stash的记录<br>
`git stash drop`  通过名字指定删除哪个stash，默认删除最近stash（stash@{0}）<br>
`git stash clear` 删除所有缓存的stash<br>
`git stash branch branchName` 创建一个新分支，检出存储，丢弃储藏
