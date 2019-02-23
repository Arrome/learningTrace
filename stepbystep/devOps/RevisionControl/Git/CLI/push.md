# git push

`git push origin master` 本地master分支推送到origin主机的master分支，若master不存在，则被创建。<br>
`git push origin localBranch：remoteBranch` 本地分支推送到远程对应分支<br>
`git push origin :remoteBranch` 删除对应的远程分支`git push origin --delete master`<br>
`git push origin` 若本地分支和远程分支存在追踪关系，两者可省略。若本地分支只有一个追踪分支，那么主机名可以省略
