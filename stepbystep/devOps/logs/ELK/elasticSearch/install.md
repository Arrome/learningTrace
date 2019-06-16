# 安装

1. 下载zip包`wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.1.1-linux-x86_64.tar.gz`
2. 解压
3. `cd bin && ./elasticSearch`（不能以root用户运行）
4. 验证ES启动成功 `curl http://localhost:9200/?pretty`（默认只能主机访问）
