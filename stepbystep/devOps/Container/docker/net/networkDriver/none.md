# none模式

Docker容器**拥有自己的network namespace**，但并**不为Docker容器进行任何网络配置**（没有网卡，IP，路由等信息）需要我们**自己为docker容器添加网卡配置IP**
