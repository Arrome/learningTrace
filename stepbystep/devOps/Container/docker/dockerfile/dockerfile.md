# Dockerfile 文本配置文件

> 不区分大小写，但约定指令使用大写用于区分<br>
> 支持以 `#` 开头的注释行<br>

#### ARG
**格式**：`ARG <name>[=<default value>]`
> 唯一一个可以在 FROM 之前的指令，必须先指定才能使用`--build-arg`
> 含义：设置变量，docker build创建镜像时使用,`--build-arg <key>=<value>`指定参数，<br>
> 也可定义时指定参数默认值，当创建镜像时没有指定参数值，将会使用默认值

基础镜像信息
----------
#### FROM
**格式**： `FROM [--platform=<platform>] <image> [AS <name>]`或者`FROM [--platform=<platform>] <image>:<tag> [AS <name>]`或者`FROM [--platform=<platform>] <registry>@hashId [AS <name>]`<br>
**注** ：第一条指令必须为FROM指令。若同一个Dockerfile中创建多个镜像时，可以使用多个FROM指令(每个镜像一次)
>* `[AS <name>]` 分步构建，可以在下一个stage 使用 `COPY --from=<name|index>`
>* `[--platform=<platform>]` 多平台引入使用`linux/amd64, linux/arm64, or windows/amd64` 默认：当前系统

>预定义ARG：
>*   HTTP_PROXY
>*   http_proxy
>*   HTTPS_PROXY
>*   https_proxy
>*   FTP_PROXY
>*   ftp_proxy
>*   NO_PROXY
>*   no_proxy

维护者信息
---------
#### MAINTAINER（最新版本已经被弃用）
**格式**：`MAINTAINER <name>`

#### LABEL
**格式**：`LABEL <key>=<value> <key>=<value> ...`
作用：元数据信息添加到镜像，可以替代MAITAINER（LABEL maintainer=xxx）
> 键值对存在空格，使用引号或反斜杠转义
> 可以有多个LABEL(元数据)，但不建议。建议一行。
> **注意**：LABEL会继承基础镜像的LABEL，如key相同则value覆盖

镜像操作指令
----------
#### RUN
**格式**：`RUN <command>`或`RUN ["executable","param1","param2"]`<br>
**注**：
  * `RUN <command>`：将在shell终端运行命令，即`/bin/sh -c`,此进程在容器中PID不为1，不能接收Unix信号
  * `RUN ["executable","param1","param2"]`：使用exec执行，不会以`/bin/sh -c`发起，常见的shell操作不会生效，若指定使用其他终端可使用第二种方式实现：例如`RUN["/bin/bash","-c","echo hello"]`
> **构建容器时`docker build`执行**，每条RUN指令将在当前镜像基础上执行指定命令，并提交为新的镜像（**创建新的镜像层，经常用于安装软件包**）。命令较长时可以使用`\`来换行

容器启动指令
---------
#### CMD
**格式**：
* `CMD ["executable","param1","param2"]`,使用exec执行，**推荐方式**<br>
* `CMD command param1 param2`,在/bin/sh中执行，提供需要交互的应用，**进程PID不为1，可能会启动失败，原因:docker会把PID=1的进程作为默认程序，不为1其不是以daemon进程存在**
* `CMD ["param1","param2"]`,提供给ENTRYPOINT的默认参数
> （**设置容器启动后`docker run`默认执行的命令及参数**）<br>
**每个Dockerfile只能有一条CMD命令。如果指定多条命令，只有最后一条会被执行**<br>
> **如果用户启动容器时`docker run`，指定了运行命令，则会覆盖掉CMD指定的命令**<br>
> 把可能需要变动的参数写到CMD里

#### ENTRYPOINT
**格式**：
  * `ENTRYPOINT ["executable","param1","param2"]`(推荐)
  * `ENTRYPOINT command param1 param2`(shell中执行，`docker run`或CMD参数无法传递过来)
> **(配置容器启动时执行的命令)，且不可被 docker run 提供的参数覆盖**<br>
> **每个Dockerfile中只能有一个ENTRYPOINT，当指定多个时，只有最后一个生效**<br>
> **`docker run`运行容器时指定的参数都会被传递给ENTRYPOINT，且会覆盖CMD命令指定的参数**<br>
> `docker run --entrypoint` 重写ENTRYPOINT入口点

> **ENTRYPOINT为容器启动的入口点，CMD为其提供默认参数，docker run提供参数则覆盖CMD**<br>
> **无 ENTRYPOINT，CMD作为默认命令，docker run提供命令则覆盖CMD**<br>
> **CMD为ENTRYPOINT提供默认参数是基于镜像层次，同一镜像层次下有效，可不同dockerfile中**<br>

#### EXPOSE
**格式**：`EXPOSE <port>[/protocol] [<port>[/protocol]...]`

#### ENV
**格式**：`ENV <key> <value>`或`ENV <key>=<value> ...`
> **指定一个环境变量，会被dockerfile后续RUN、ADD、COPY等指令使用，并在容器运行时保持**<br>
> 运行时可替换环境变量

#### ADD
**格式**:`ADD <src> ... <dest>`或者`ADD <src>,... <dest>`或者`ADD["src",..,"dest"]`
> src为文件时，注意：dest 以`/`结尾被作为目录，否则被作为文件。src为目录时，dest也被作为目录<br>

> src 可以是:
* Dockerfile所在目录的一个相对路径(文件或目录),不包含目录本身，
* 也可是一个URL（**不建议，建议curl，wget方式减少构建层数**）；
* 还可以是一个tar文件(本地文件会自动解压为目录，url文件不会自动解压) <br>


#### COPY
**格式**：`COPY <src> ... <dest>`或者`COPY <src>,... <dest>`或者`COPY["src",..,"dest"]` <br>
  **当使用本地目录为源目录时，推荐使用COPY**，可用在multistage构建中，没有ADD拷贝网络文件和解压压缩包的功能<br>
> **不拷贝src当前目录，只复制目录下的文件或目录** <br>
> **dest必须是目录，目标路径不存在时，会自动创建** <br>

#### USER
**格式**：`USER daemon`
> 指定运行容器时的用户名或UID，后续的RUN也会使用指定用户
> **当服务不需要管理员权限时，可以通过该命令指定运行用户**例如：`RUN groupadd-r postgres&useradd-r-g postgres postgres`**临时获取管理员权限，可以使用gosu，不推荐sudo**

#### WORKDIR
**格式**：`WORKDIR /path/to/workdir`
> 为后续RUN、CMD、ENTRYPOINT、ADD、COPY 指令配置工作目录<br>
> 可以使用多个WORKDIR指令，如果参数是相对路径，则会基于之前指令指定的路径，<br>
> 运行后也是以workdir为根目录打开<br>
> `docker run -w`覆盖设置的WORKDIR

#### VOLUME
**格式**：`VOLUME["/data/"]`或者`VOLUME /data/`
镜像中创建一个挂载点目录，以挂载Docker host上的卷或者其他容器上的卷<br>
> 创建时就产生挂载点，自动挂载。`--volume-from`共享挂载卷和使用容器卷

#### ONBUILD
**格式**：`ONBUILD [INSTRUCTION]`
> (定义的触发器，延迟执行)配置所创建的镜像作为其他新创建镜像的基础镜像时，所执行的操作指令<br>
> 新创建镜像，Dockerfile中使用FROM 会自动执行基础镜像ONBUILD指令内容，等同于后面加了指令。<br>
> **使用ONBUILD指令的镜像，推荐在标签注明**.例如 ruby:1.9-onbuild

#### SHELL





#### STOPSIGNAL
**格式**：`STOPSIGNAL signal`
> 含义：设置停止容器所发送的系统调用信号

####HEALTHCHECK
**格式**：`HEALTHCHECK [options] CMD command`<br>
检测容器是否有效<br>


shell格式和exec格式
---------------
shell格式由`/bin/sh`启动子进程，它不是PID=1的超级进程，从而无法收到Unix信号，不能收到从`docker stop xxx`发来的SIGTERM信号

**docker stop优雅关闭容器原理**：向容器PID=1的超级进程发送SIGTERM信号，并给予10s(--time)清理，超时-9 kill。shell格式启动的进程收到了SIGTERM不会转发给子命令，造成`/bin/sh`收到SIGTERM未作相应被强杀，同时把他的子进程也杀掉了。

自定义配置文件，使用entrypoint.sh脚本
-------------------
`ENTRYPOINT ["/bin/entrypoint.sh"]` 作为预先配置<br>
`CMD [param1 ...]`作为进程启动命令<br>
