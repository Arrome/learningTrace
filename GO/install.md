# 安装
1. 下载二进制安装包
2. 解压 `tar -C /usr/local -xzf go1.11.linux-amd64.tar.gz`
3. 配置环境变量<br>
  `export GOROOT=/usr/local/go`<br>
  `export PATH=$PATH:$GOROOT/bin`<br>
4. `go env`查看配置环境信息
5. `godoc -http=:6060` 访问GO安装包中的文档：http://localhost:6060
