# docker build

Dockerfile执行流程：
1. docker从基础镜像运行一个容器
2. 执行一条指令并对容器进行修改
3. 执行类似docker commit的操作提交一个新的镜像层
4. docker再基于刚提交的镜像运行一个新的容器
5. 执行Dockerfile中下一条命令直到所有指令执行完毕

创建镜像
-------------
**格式**：docker build[选项]路径：`docker build .`<br>

  -t 指定镜像标签信息
  -f 指定Dockerfile路径

> 读取指定路径下(包括子目录)Dockerfile，并将该路径下所有内容发送给Docker服务端，由服务端创建镜像。<br>
> **因此一般建议放置Dockerfile的目录为空目录**<br>
> **可以通过 .dockerignore文件(每一行添加一条匹配模式) 来让Docker忽略路径下的目录和文件**<br>
> json数组需要使用双引号。<br>
