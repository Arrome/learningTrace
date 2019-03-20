# 交互式shell和非交互式shell、登录shell和非登录shell

先执行A,然后执行B,C(B1,B2,B3表示只会执行第一个存在的文件)

| |login|interactive non-login|non-interactive non-login|
|------|---------------|-----------------|--------------|
|/etc/profile|A|||
|/etc/bash.bashrc||A||
|~/.bashrc||B||
|~/.bash_profile|B1|||
|~/.bash_login|B2|||
|~/.profile|B3|||
|BASH_ENV|||A|

`~/.profile` 用于login shell,想在整个用户会话期间都有效的内容都应该放置在这，比如启动进程，环境变量等<br>
`~/.bashrc` 只放置与bash有关命令，所有与交互有关的命令都出现在这，比如：bash的补全、alias、颜色、提示符等<br>

典型模式
-------
* **login + interactive**：
  1. 登录机器后的第一个shell
  2. 通过SSH登录到远程主机
* **non-login + interactive**:
  1. 新启动一个shell进程（如运行bash）
  2. 远程执行脚本同时请求控制台(如：`ssh user@remote -t 'echo $PWD'`)
* **non-login + non-interactive**:
  1. 执行脚本（如：`bash script.sh`）
  2. 运行头部有`#!/usr/bin/env bash`的可执行文件（如`./executable`）
  3. 远程执行脚本(如：`ssh user@remote script.sh`)


bash/sh
------
* `-l  ,--login` 以登录方式执行shell脚本
