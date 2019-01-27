# 变量与引用

1. 通过Inventory文件定义主机以及主机组变量
  **若主机和主机组都定义了变量且key名称相同，则单台主机定义的变量生效**
  ```
  192.168.1.116 key=116
  192.168.1.117 key=117
  192.168.1.118 key=118
  [nginx]
  192.168.1.11[6:8]
  [nginx:vars]
  ansible_python_interpreter=/usr/bin/python
  ```
2. 通过/etc/ansible下的文件定义主机以及主机组变量
  默认使用yum安装Ansible的配置文件在/etc/ansible目录下，在此目录下新建host_vars和group_vars目录针对主机和主机组定义变量
> 注意：group_vars目录下新建文件，名称为主机组名，文件内容yaml语法，`key: value`方式<br>
host_vars目录下新建文件，名称为主机名，文件内容yaml语法，`key: value`方式<br>

3. 通过ansible-playbook命令行传入定义变量，默认传进去的变量都是全局变量。也支持同时传入多个变量，还支持指定文件的方式传入，文件内容支持YAML和JSON两种格式
```
  ansible-playbook variable.yaml -e "key=KEY"

  ansible-playbook variable.yaml -e "@var.yaml"
```
4. 在 playbook文件内使用vars
```
---
  - hosts： all
    gather_facts: False
    vars:
      key: ansible
    tasks:
      - name: display Host Variable from hostfile
```
5. 在playbook文件内使用vars_files引用变量文件
```
---
  - hosts： all
    gather_facts: False
    vars_files:
      - vars.yaml
    tasks:
      - name: display Host Variable from hostfile
```
6. 使用register内的变量，task之间相互传递数据，比如有两个task，其中第二个task是否执行是需要判断第一个task运行后的结果，这个时候我们需要在task间传递数据。

7. 使用vars_prompt传入，运行playbook时交互方式给定义好的参数传入变量值，只需在playbook中定义vars_prompt的变量名和交互式提示内容即可。
