# ngx_http_upstream_module

server
-------
设备状态：
* down：表示当前的server暂时不参与负载
* weight：默认为1，wight越大，负载的权重越大
* max_fails：允许请求失败的次数默认为1.当超过最大次数时，返回proxy_next_upstream模块定义的错误。
* fail_timeout：max_fails此失败后，暂停的时间。
* backup：其他所有非backup机器宕或者忙的时候，请求backup的机器。

upstream
----------
负载均衡池,server中增加`proxy_pass http://bakend/;`<br>
```
upstream backend {
    server backend1.example.com       weight=5;
    server backend2.example.com:8080;
    server unix:/tmp/backend3;

    server backup1.example.com:8080   backup;
    server backup2.example.com:8080   backup;
}

server {
    location / {
        proxy_pass http://backend;
    }
}
```
