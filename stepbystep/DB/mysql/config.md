#配置文件
配置文件my.cnf
--------
1. 查看所有my.cnf

    ```
    locate my.cnf
    ```
2. 查看默认my.cnf加载优先顺序
    ```
    mysql --help | grep my.cnf
    ```
3. 查看指定my.cnf启动的
    ```
    ps aux|grep mysql|grep 'my.cnf'
    ```
4. 启动不使用配置文件<br>
   启动时未指定配置文件且默认加载目录无配置文件，则使用默认配置