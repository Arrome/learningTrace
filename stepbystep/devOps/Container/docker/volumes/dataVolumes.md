# 数据卷

**命令**：docker run -v localPath:containerPath
> -v 可以创建多个数据卷 <br>
> **本地目录的路径必须是绝对路径，如果不存在，Docker自动创建**
> Docker挂载数据卷默认权限读写(rw),用户也可以通过 ro 指定为只读。例如：`docker run -d -P --name web -v /src/webapp:/opt/webapp:ro webapp python app.py`<br>
> -v 标记可以从主机挂载单个文件到容器中作为数据卷(**使用文件编辑工具vi，sed--in-place可能造成inode改变，不推荐**)。例如：`docker rm --rm -it -v ~/.bash_history:/.bash_history ubuntu`
