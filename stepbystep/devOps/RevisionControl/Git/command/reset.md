# reset
实际：修改引用（如 .git/ref/heads/master）的游标指向,实际上针对的是头指针HEAD，而HEAD指向一个引用refs/heads/master

> 注意：下面命令使用了 --hard ，会破坏工作区未提交的改动，慎用

`git reset --hard HEAD^` 回退到上一次版本
`git reset --hard 9e8a761` 回退到更远的一次提交
`git reset --hard master@{2}` 重置master为两次改变之前的值
