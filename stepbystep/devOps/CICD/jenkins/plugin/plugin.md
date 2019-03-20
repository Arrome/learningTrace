# 插件仓库地：
http://updates.jenkins-ci.org/download/plugins/

构建参数插件
-------------
* 普通的参数类型（布尔型、字符串型、多行文本型、选择型和文件型）
* Active Choices（级联参数）
* hidden-parameter（隐藏参数）
* extended-choice-parameter & extensible-choice-parameter (可定义动态参数)
* validating-string-parameter
* nodelabelparameter（增加了一个新的参数类型，Node 和 Label，从而使用户通过参数可以选择项目构建运行的节点）

自定义样式
-------
* simple-theme-plugin （自定义CSS，JavaScript，图标）
* HTML Publisher plugin（发布存档html报告）

用户及权限
--------------
Jenkins 用户权限管理是Jenkins Administration中非常很重要的环节，由于大部分企业都会有自己的域控管理，所以和LDAP集成并基于用户组实现权限模型设计与管理是企业级Jenkins实践的重要内容。

* [LDAP](https://plugins.jenkins.io/ldap)<br>
允许使用LDAP对用户进行认证，LDAP 服务器可以为Active Directory 或者 OpenLDAP。
* [Active Directory](https://plugins.jenkins.io/active-directory)<br> 允许使用Active Directory对用户进行认证，同时结合诸如Matrix Authorization Strategy插件，可以识别用户所在的所有用户组，对用户授权进行灵活配置。基于Windows Active Directory进行域管理的企业，推荐采用Active Directory。

* [GitHub Authentication](https://plugins.jenkins.io/github-oauth)<br>提供了使用GitHub进行用户认证和授权的方案。

* [Gitlab Authentication](https://plugins.jenkins.io/gitlab-oauth)<br>提供了使用GitLab进行用户认证和授权的方案。

* [Matrix Authorization Strategy](https://plugins.jenkins.io/matrix-auth)
提供了基于矩阵的授权策略，支持全局和项目级别的配置。

* [Role-based Authorization Strategy](https://plugins.jenkins.io/role-strategy)
提供了一种基于角色（Role）的用户权限管理策略，支持创建global角色、Project角色、Slave角色，以及给用户分配这些角色。这款插件是最常用的Jenkins权限策略和管理插件。

代码管理
---------------
Jenkins 项目中配置Source Code Management 去下载代码进行构建任务，是非常普遍的应用场景。Jenkins插件支持很多SCM的系统，使用最常见的是Git 和SVN。

* [Git](https://plugins.jenkins.io/git)<br>
支持使用Github、GitLab、Gerrit等系统管理代码仓库。

* [Subversion](https://plugins.jenkins.io/subversion)
支持Subversion系统管理源代码。

项目及视图
-------------
Jenkins中对Project 和 view的管理，是用户日常工作中使用很多的功能。

* [Folder](https://plugins.jenkins.io/cloudbees-folder)<br>支持用户使用目录管理项目，目录支持嵌套，并且支持目录中创建视图。

* List view Jenkins (默认支持List类型的视图，用户可以创建List视图过滤所关心的项目)

* [Sectioned View](https://plugins.jenkins.io/sectioned-view)<br>
支持一种新的视图，视图可以分为多个部分，每部分可以单独配置显示所选择的项目信息。

* [Nested View](https://plugins.jenkins.io/nested-view)<br>
支持一种新的视图，其表示直接显示项目，而是以目录图标显示所包含的子视图，每个子视图显示所选项目信息。

* [Build Pipeline](https://plugins.jenkins.io/build-pipeline-plugin)<br>
提供了一种Build Pipeline 视图，用于显示上、下游项目构建的关系。

构建触发
-----------------
* Build periodically（Jenkins 内置功能，可以设置类似crontab时间，周期性地自动触发构建）
* Poll SCM （Jenkins 内置功能，类似Build periodically，可以设置类似crontab时间，不同的是不是直接进行构建，而是周期性地在后台检查所配置的SCM有没有更新，只有当有代码更新时才会触发构建）
* Trigger builds remotely（Jenkins 内置功能，远程触发构建，通过设置token可以支持远程脚本中触发Jenkins构建）

* Parameterized-Trigger-Plugin（触发新的带参数信息的job构建）
* Gerrit-Trigger（将Jenkins集成到Gerrit code review中，支持Jenkins配置Gerrit服务器等信息，实现Gerrit event 触发Jenkins 构建）
* Gitlab-plugin （将Jenkins 集成到GitLab web hook中，支持Gitlab 分支及Merge Request等相关事件触发Jenkins构建）
* GitHub Integration （github-pullrequest）将Jenkins集成到GitHub中，支持Gitgub分支及Pull requests 触发Jenkins 构建
* JIRA Trigger (将Jenkins集成到Jira WebHooks中，支持Jira issue的状态等变化时触发Jenkins构建)

构建任务及环境
------------
围绕构建任务，有许多小的插件，却提供了一些实用的功能
* [Workspace Cleanup](https://plugins.jenkins.io/ws-cleanup)，这个插件支持在构建前后 删除或者部分删除workspace
* [description setter](https://plugins.jenkins.io/description-setter)，这个插件支持正则表达式匹配构建log输出，设置构建的描述
* [build-name-setter](https://plugins.jenkins.io/build-name-setter)，这个插件支持设置构建的显示名字，而不是默认的为#1，#2，……，#buildnum
* [Environment Injector](https://plugins.jenkins.io/envinject)，这个插件支持在构建任务的不同阶段插入环境变量，并且在构建结束导出所有的环境变量等功能。

构建通知
----------
把构建状态及时地通知用户，是Jenkins的一个必不可少的功能。Jenkins支持多种主动和被动的通知方式。

* [Mailer](https://plugins.jenkins.io/mailer)，这个插件支持基本的邮件通知功能，比如构建失败和构建恢复成功可以发送邮件通知给相关人员。
* [Email Extension](https://plugins.jenkins.io/email-ext)，这个插件是邮件通知的扩展，支持定制邮件内容，触发条件以及邮件接收者，功能比基本邮件通知要灵活强大的多。
* [Slack Notification](https://plugins.jenkins.io/slack)，这个插件支持把构建结果推送到Slack channel。

容器化Slave
------------
Jenkins的Master-Slave架构实现了分布式构建，可以充分的横向扩展Slave来提升构建能力，将Slave容器化是目前主流的构建环境标准化、集群化和弹性化的方式。

* docker-plugin (系统配置云docker，docker启动模板，动态的提供agent（slave），运行构建后再销毁这个slave.可使用jenkins/jnlp-slave的docker镜像作为slave启动镜像)
* docker-build-step (系统配置docker监听ip端口，job中build步骤中可以执行docker命令)
* docker-slaves （系统配置docker镜像仓库等信息，允许在job里将构建环境定义为docker镜像或Dockerfile）
* kubernetes (支持利用Kubernetes cluster 动态的提供Jenkins Agent（Slave），利用Kubernetes 调度机制来优化Jenkins 负载等)


Admin相关插件
--------------
* [Configuration Slicing](https://plugins.jenkins.io/configurationslicing)，这个插件支持批量修改项目配置
* [Mask Passwords](https://plugins.jenkins.io/mask-passwords)，这个插件支持遮挡构建log输出的password等敏感信息
* [Backup](https://plugins.jenkins.io/backup)，这个插件添加备份功能到Jenkins management
