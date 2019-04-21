#镜像仓库自定义配置

由于默认镜像仓库docker hub下载速度很慢，可自己更改国内docker镜像仓库<br>
参考：`https://www.docker-cn.com/registry-mirror`

方法一：永久保存（docker版本10以上可以使用[此说法有待验证]）
------------------
    1、在/etc/docker目录下新增一个daemon.json文件
    daemon.json文件内容为：
    {"registry-mirrors": ["https://registry.docker-cn.com","https://w5e0yetj.mirror.aliyuncs.com"],"live-restore": true}

    > `"live-restore": true` docker1.12后支持，避免了docker服务异常而造成容器退出（即关闭docker daemon ，而不关闭容器）服务恢复后，容器也可以再被服务抓到并可管理

    注：docker官方中国区仓库 https://registry.docker-cn.com
        aliyun镜像仓库 https://w5e0yetj.mirror.aliyuncs.com（参考网址：https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors）

    2、重启docker，执行命令 service docker restart

方法二：命令直接从仓库下载
-------------------------
注: 除非修改了 Docker 守护进程的 `--registry-mirror` 参数, 否则您将需要完整地指定官方镜像的名称。例如，library/ubuntu<br>

    docker pull registry.docker-cn.com/myname/myrepo:mytag

方法三：docker启动时定义`--registry-mirror`参数
---------------------------

    docker --registry-mirror=https://registry.docker-cn.com daemon
