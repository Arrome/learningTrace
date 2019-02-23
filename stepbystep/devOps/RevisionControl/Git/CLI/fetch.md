# fetch

将所有远程仓库所包含分支的最新commitID，记录到.git/FETCH_HEAD文件中。<br>

.git/FETCH_HEAD:版本链接，指向目前已经从远程仓库取下来的分支的末端版本(最新状态)，每一行对应远程服务器一个分支<br>

`git fetch origin remoteBranch:localBranch` 拉取远程分支并创建本地分支<br>
