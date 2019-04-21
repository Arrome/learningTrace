# 安装

安装依赖：
1. GCC编译工具`yum install -y gcc`
2. gzip模块需要 zlib 库（http包内容做gzip格式压缩，减少网络传输量）：`yum install -y zlib zlib-devel`,`zlib-devel`是二次开发所需要的库
3. rewrite模块需要 pcre 库（perl兼容正则表达式）：`yum install pcre*`
4. ssl功能需要 openssl 库：`yum install openssl*`

安装nginx
----------
下载地址：http://nginx.org<br>
```
./configure --prefix=/usr/local/nginx \
--sbin-path=/usr/local/nginx/nginx \
--conf-path=/usr/local/nginx/nginx.conf \
--pid-path=/usr/local/nginx/nginx.pid \
--with-http_ssl_module \
--with-pcre=/opt/app/openet/oetal1/chenhe/pcre-8.37 \
--with-zlib=/opt/app/openet/oetal1/chenhe/zlib-1.2.8 \
--with-openssl=/opt/app/openet/oetal1/chenhe/openssl-1.0.1t

make && make install
```
* `--with-pcre` 设置pcre库的源码路径，yum安装可自动找到库文件
* `--with-zlib=PATH` 指定zlib源码解压目录
* `--with-http_ssl_module` 使用https协议模块，默认模块没有被构建（前提openssl openssl-devel已安装）
