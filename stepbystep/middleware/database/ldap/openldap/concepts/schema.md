# schema

整个openldap目录树的标准规范。标识数据和类型的关系。（例如需要支持xxx服务用户验证，slapd.conf文件需要包含服务对应的schema文件）<br>
schema （可理解为关系数据库的存储引擎，定义存储方式及不同条目关系） 指定一个条目（可理解为具体对象）所包含的objectClass 以及每一个对象类所包含的属性值（必选+可选）。<br>

schema 文件一般存放在`/etc/openldap/schema`<br>
在 配置文件slapd.conf 通过import引入<br>


查看软件服务安装包提供的schema文件:`rpm -ql sudo | grep -i schema`<br>



objectClass
---------
分类：<br>
* 结构型：例如 person、organizationUnit
* 辅助型：例如 extensibleObject
* 抽象型：例如 top （不能直接使用）


attribute
-------------
|属性|描述|
|-|-|
|dn(distinguished name)|唯一标识名，每个对象都有一个唯一标识名|
|rdn(relative dn)|相对标识名|
|uid(user id)|用户登录名|
|sn(sur name)|姓|
|giveName|名字|
|I|通常指地名|
|objectClass|特殊属性，包含数据存储方式及相关属性|
|dc(domain component)|通常指域名|
|ou(organization unit)|组织名称|
|cn(common name)|对象名称|
|mail|登录账号邮箱|
|telephoneNumber|登录账号手机|
|c(country)|国家，例如CN、US|
