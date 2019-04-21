# distribution(Docker Registry 2)

1. 安装docker registry仓库
```
docker run -d -p 5000:5000 -v `pwd`/data:/var/lib/registry --restart=always --name registry registry
```
2. 镜像`docker tag`打仓库标记，`docker push`上传仓库
3. 配置http，客户端默认使用https协议<br>
  `/etc/docker/daemon.json`中配置非安全仓库`"insecure-registries": ["192.168.183.134:5000"]`

> 默认上传信息 `/var/lib/registry`
