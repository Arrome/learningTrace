# 目录结构

```
production     # production环境的inventory文件
stage          # stage环境的inventory文件
group_vars/
  group1       # group1定义的变量文件
  group2       # group2定义的变量文件
host_vars/
  hostname1    # hostname1定义的变量文件
  hostname2    # hostname1定义的变量文件
library/       # 自定义模块存放目录
filter_plugins/ # 自定义filter插件存放目录
site.yaml       # playbook统一入口文件
webservers.yaml  # 特殊任务playbook文件
roles/           # role存放目录
  common/         # common角色目录
    tasks/
      main.yaml     # common角色task入口文件
    handlers/
      main.yaml     # common角色handler入口文件
    templates/
      ntp.conf.j2   # common角色template文件
    files/
      bar.txt       # common角色file资源文件
      foo.sh
    vars/
      main.yaml     # common角色变量定义文件
    defaults/
      main.yaml     # common角色变量定义文件（优先级低）
    meta/
      main.yaml     # common角色依赖文件
  webtier           # webtier角色目录
  monitoring
  fooapp
```
