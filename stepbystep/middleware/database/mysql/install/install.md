# 安装

1. yum方式安装
2. 根据源码改造制作rpm
3. 编译安装方式(编译C)，configurate，cmake
  ```
  指定默认字符集：
  --DDEFAULT_CHARSET=utf8 \
  --DDEFAULT_COLLATION=utf8_general_ci \
  ```
4. 解压安装方式


优雅关闭
------
不使用`kill`暴力关闭<br>

1. `mysqld stop`
2. `mysqladmin shutdown`
