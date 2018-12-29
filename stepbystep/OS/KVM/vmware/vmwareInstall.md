# linux下 vmare 安装与卸载

安装
------
vmware workspace下载地址：https://www.vmware.com/cn/products/workstation-pro/workstation-pro-evaluation.html?_t_t_t=0.5296935777399265

vmware共享序列号：http://beikeit.com/post-514.html


```
chmod +x VMware-Workstation-Full-14.1.2-8497320.x86_64.bundle
sudo ./VMware-Workstation-Full-14.1.2-8497320.x86_64.bundle
vmware
```

> 问题1:无法加载libcanberra-gtk-module.so的问题<br>
 `locate libcanberra-gtk-module.so`<br>
 查看结果：<br>
 /usr/lib/x86_64-linux-gnu/gtk-2.0/modules/libcanberra-gtk-module.so
 /usr/lib/x86_64-linux-gnu/gtk-3.0/modules/libcanberra-gtk-module.so

先创建两个文件,将.so的路径加入到这两个文件中：
    ```
    sudo touch /etc/ld.so.conf.d/gtk-2.0.conf
    sudo touch /etc/ld.so.conf.d/gtk-3.0.conf
    ```
    sudo vim /etc/ld.so.conf.d/gtk-2.0.conf插入/usr/lib/x86_64-linux-gnu/gtk-2.0/modules/libcanberra-gtk-module.so
    对于另一个文件，就加入另一个路径了。
    使用ldconfig重新加载下 `sudo ldconfig`
    重新运行 `sudo ./VMware-Workstation-Full-11.1.2-2780323.x86_64.bundle`
> 问题2:Gtk-WARNING **: 无法在模块路径中找到主题引擎：“murrine”
`sudo apt-get install gtk2-engines-murrine`

卸载
---------
```
sudo vmware-installer -u vmware-workstation
```
