# 常见命令操作

新建代码库
----------
```
git init 创建本地仓库
git add . 添加所有文件
git commit -m "" 提交文件到本地仓库(强制要求输入提交说明),提交之前需要git add添加到提交任务才能提交()
git remote add origin gitAddress 本地库关联远程库
git remote remove origin 取消本地目录下关联的远程库
git push -u origin --all 上传文件到远程仓库
```

回退代码并提交远程仓库
-----------------
```
git log --oneline 查看提交历史
git reset --hard commitID

git checkout -b temp
git push origin temp：temp 新建分支并切换推送到远端暂存

git push origin --delete master
git branch -d master 删除master分支

git checkout -b master
git push origin master  新建master分支，并提交

git branch -d temp
git push origin --delete temp 删除暂存分支

```
> **注意**：直接提交回退会提交不了，需要先pull远端。
> 删除远端分支，不能直接删除默认分支，需要远端分支页设置切换默认分支

显示工作区目录位置
------------
```
git rev-parse --git-dir 显示版本库.git目录所在位置
git rev-parse --show-toplevel 显示工作区根目录
git rev-parse --show-prefix 相对于工作区根目录的相对目录
git rev-parse --show-cdup 显示从当前目录后退到工作区的根的深度
```

`git grep "工作区文件内容搜索"`
`git status -s` 显示文件状态
`git clone demo demoBackup` 通过clone进行备份
`git clone -b branchName httpURL/gitURL` 下载指定分支文件
