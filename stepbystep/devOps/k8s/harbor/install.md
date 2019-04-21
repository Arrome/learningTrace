# 安装vmware/harbor

需要先安装 python，docker engine，docker compose(依赖其他工具，借助编排工具)，openssl

1. 下载安装包`wget http://harbor.orientsoft.cn/harbor-v1.5.0/harbor-offline-installer-v1.5.0.tgz`
2. 解压`tar xf harbor-offline-installer-v1.5.0.tgz -C /usr/local/kubernetes/`
3. 配置harbor.cfg文件
4. `./install.sh`

> 停应用`docker-compose stop`,必须在安装目录下即`docker-compose.yml`文件目录下
