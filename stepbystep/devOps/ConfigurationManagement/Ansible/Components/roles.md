# role

按角色对内容进行分组（可与其他用户共享角色）<br>
**基于已知文件结构自动加载vars,files,tasks,handlers,templates,defaults,meta**<br>

角色目录：
------
```
roles
└── role_name
    ├── files # 存储由copy或script等模块调用的文件
    ├── handlers #至少一个main.yaml文件，用于定义各handler，其他文件需要由main.yaml进行包含调用
    │   └── main.yml
    ├── tasks  #至少一个main.yaml文件，用于定义各task，其他文件需要由main.yaml进行包含调用
    │   └── main.yml
    └── templates  # 存储由template模块调用的模板文件
    └── vars  #至少一个main.yaml文件，用于定义各variable，其他文件需要由main.yaml进行包含调用
    │   └── main.yml
    └── meta  #至少一个main.yaml文件，定义当前角色的特殊设定及依赖关系，其他文件需要由main.yaml进行包含调用
    │   └── main.yml
    └── default #至少一个main.yaml文件，用于设定默认变量
    │   └── main.yml
```
