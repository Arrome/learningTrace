# 滚动发布

定义：取出一个或者多个服务器停止服务，执行更新，并重新将其投入使用。周而复始，直到集群中所有实例都更新成新版本<br>
特点：节约资源，无法确定新旧环境，回滚困难<br>
      若部署期间，系统进行扩缩容，需要判断哪个节点使用哪个代码<br>
      逐步更新，上线代码会出现短暂新旧版本不一致情况。<br>