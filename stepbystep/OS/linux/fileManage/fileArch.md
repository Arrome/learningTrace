# 文件目录结构

```
/              根目录
├── bin     存放系统用户执行文件
├── boot    存放内核引导配置文件
├── dev     存放设备文件
├── etc     存放系统配置文件
    |—— rc.d       开机启动文件
    |--rc.local    用户自定义自启动文件(一般为源码安装)
    |—— init.d     服务配置文件(一般为包安装)
    |—— ssh        SSH配置文件
    |--sysctl.conf 配置系统信息，内容全部对应于/proc/sys目录下子目录和文件。编辑后`sysctl -p`生效，`sysctl -w key=value`
├── home    用户主目录
├── lib     动态共享库
├── lost+found  文件系统恢复时的恢复文件
├── media   可卸载存储介质挂载点
├── mnt     文件系统临时挂载点
├── opt     附加的应用程序包
├── proc    系统内存的映射目录，提供内核与进程信息
    |—— sys        内核参数
├── root    root 用户主目录
├── sbin    存放系统管理的执行文件
├── srv     存放服务相关数据
├── sys     sys 虚拟文件系统挂载点
├── tmp     存放临时文件
├── usr     存放用户应用程序
    |──sbin 系统管理的必备执行文件
        |--init 系统根进程，所有进程的祖先。根据记录在/etc/inittab里脚本程序产生进程（控制用户的登录模式）
    |──bin 应用软件工具的必备执行文件
    |——lib
        |——systemd
            |——system
              |——XXX.service 应用服务配置文件
└── var     存放邮件、系统日志等变化文件
    |──log  日志文件
        |--messages  整体系统信息，也包含系统启动期间日志，此外cron，daemon，kern，auth等内容
        |--secure    安全信息
        |--dmesg     内核缓冲信息
        |--boot.log  系统启动时的日志
```
