# pull

相当于 `git fetch`和`git merge`结合（基于本地FETCH_HEAD记录，对比本地的FETCH_HEAD记录与远程仓库版本号，然后git fetch获得当前指向的远程分支后续版本数据，然后git merge将与本地当前分支合并。）
