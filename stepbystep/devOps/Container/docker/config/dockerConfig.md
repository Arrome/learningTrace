# Docker配置

docker 代理
----------
在 docker.service中配置`Environment="HTTPS_PROXY=xxx.xxx.xxx.xxx:443" "NO_PROXY=localhost,127.0.0.1,xxx.xxxxxx:5000"`<br>
* HTTPS_PROXY 设置的代理服务器地址端口
* NO_PROXY  某些情况下不需要使用https代理访问，一般配置私有仓库地址
