# Dockerfile 文本配置文件

> 支持以 `#` 开头的注释行

基础镜像信息
----------
####FROM
**格式**： `FROM <image>`或者`FROM <image>:<tag>`<br>
**注** ：第一条指令必须为FROM指令。若同一个Dockerfile中创建多个镜像时，可以使用多个FROM指令(每个镜像一次)

维护者信息
---------
####MAINTAINER
**格式**：`MAINTAINER <name>`

镜像操作指令
----------
####RUN
**格式**：`RUN<command>`或`RUN["executable","param1","param2"]`<br>
**注**：
  * `RUN<command>`：将在shell终端运行命令，即/bin/sh -c
  * `RUN["executable","param1","param2"]`：使用exec执行，若指定使用其他终端可使用第二种方式实现：例如`RUN["/bin/bash","-c","echo hello"]`
> **构建容器时执行**，每条RUN指令将在当前镜像基础上执行指定命令，并提交为新的镜像（**创建新的镜像层，经常用于安装软件包**）。命令较长时可以使用`\`来换行

容器启动指令
---------
####CMD
**格式**：
* `CMD["executable","param1","param2"]`,使用exec执行，**推荐方式**<br>
* `CMDcommand param1 param2`,在/bin/sh中执行，提供需要交互的应用
* `CMD["param1","param2"]`,提供给ENTRYPOINT的默认参数
> （**设置容器启动后默认执行的命令及参数**）<br>
**每个Dockerfile只能有一条CMD命令。如果指定多条命令，只有最后一条会被执行**<br>
> **如果用户启动容器时，指定了运行命令，则会覆盖掉CMD指定的命令**

####EXPOSE
**格式**：`EXPOSE<port>[<port>...]`

####ENV
**格式**：`ENV <key> <value>`或`ENV <key>=<value> ...`
> **指定一个环境变量，会被后续RUN指令使用，并在容器运行时保持**<br>

####ADD
**格式**:`ADD<src><dest>`
> 复制指定的<src>到容器中的<dest>. <br>
> <src>可以是Dockerfile所在目录的一个相对路径(文件或目录)，也可是一个URL；还可以是一个tar文件(自动解压为目录)

####COPY
**格式**：`COPY<src><dest>`
> 复制本地主机的<src>(为Dockerfile所在目录的相对路径，文件或目录)到容器中的<dest>.目标路径不存在时，会自动创建
> **当使用本地目录为源目录时，推荐使用COPY**

####ENTRYPOINT
**格式**：
  * `ENTRYPOINT["executable","param1","param2"]`
  * `ENTRYPOINTcommand param1 param2`(shell中执行)
> **(配置容器启动时执行的命令)，且不可被 docker run 提供的参数覆盖**<br>
> **每个Dockerfile中只能有一个ENTRYPOINT，当指定多个时，只有最后一个生效**

####VOLUME
**格式**：`VOLUME["/data"]`

####USER
**格式**：`USER daemon`
> 指定运行容器时的用户名或UID，后续的RUN也会使用指定用户
> **当服务不需要管理员权限时，可以通过该命令指定运行用户**例如：`RUN groupadd-r postgres&useradd-r-g postgres postgres`**临时获取管理员权限，可以使用gosu，不推荐sudo**

####WORKDIR
**格式**：`WORKDIR/path/to/workdir`
> 为后续RUN、CMD、ENTRYPOINT 指令配置工作目录<br>
> 可以使用多个WORKDIR指令，如果参数是相对路径，则会基于之前指令指定的路径

####ONBUILD
**格式**：`ONBUILD[INSTRUCTION]`
> 配置所创建的镜像作为其他新创建镜像的基础镜像时，所执行的操作指令<br>
> 新创建镜像，Dockerfile中使用FROM 会自动执行基础镜像ONBUILD指令内容，等同于后面加了指令。<br>
> **使用ONBUILD指令的镜像，推荐在标签注明**.例如 ruby:1.9-onbuild

####LABEL
**格式**：`LABEL <key>=<value> <key>=<value> ...`
> 可以有多个LABEL，但不建议。建议一行。
> **注意**：LABEL会继承基础镜像的LABEL，如key相同则value覆盖

####ARG
**格式**：`ARG <name>[=<default value>]`
> 含义：设置变量，docker build创建镜像时使用`--build-arg <key>=<value>`指定参数，<br>
> 也可定义时指定参数默认值，当创建镜像时没有指定参数值，将会使用默认值

创建镜像
-------------
**格式**：docker build[选项]路径<br>

  -t 指定镜像标签信息

> 读取指定路径下(包括子目录)Dockerfile，并将该路径下所有内容发送给Docker服务端，由服务端创建镜像。<br>
> **因此一般建议放置Dockerfile的目录为空目录**<br>
> **可以通过 .dockerignore文件(每一行添加一条匹配模式) 来让Docker忽略路径下的目录和文件**s
