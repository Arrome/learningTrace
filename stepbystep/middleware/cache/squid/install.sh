# 安装

#使用源码安装方式，而非二进制原因：
#* 需要获取特定操作系统参数（例如打开文件描述符的最大数量）
#* 编译特定功能
#* 甄别不同系统共享库的不同

set -x
set -e
workdir=$(dirname `readlink -f $0`)
squid_name="squid-2.6.STABLE20"
squid_dir=${workdir}/${squid_name}
squid_package=${squid_dir}.tar.gz
function exec_command() {
    $1 || exit "$PIPESTATUS"
}

function prepare_env() {
  exec_command "yum install -y wget"
  exec_command "yum install -y gcc perl"
}

function install(){
  if [[ ! -f ${squid_package} || ! -d  ${squid_dir} ]];then
    wget http://www.squid-cache.org/Versions/v2/2.6/squid-2.6.STABLE20.tar.gz
  fi
  tar zxvf squid-2.6.STABLE20.tar.gz

  cd squid-2.6.STABLE20
  ulimit -HSn 65535

  if [[ ! `id squid` ]];then
    useradd  squid
  fi
  #编译参数
  #  --with-build-environment=POSIX_V6_ILP32_OFFBIG \
  #  --enable-removal-policies=heap,lru \
  ./configure --prefix=/usr/local/squid \
  --disable-dependency-tracking \
  --enable-dlmalloc \
  --enable-gnuregex \
  --disable-carp \
  --enable-async-io=240 \
  --with-pthreads \
  --enable-storeio=ufs,aufs,diskd,null \
  --disable-wccp \
  --disable-wccpv2 \
  --enable-kill-parent-hack \
  --enable-cachemgr-hostname=localhost \
  --enable-default-err-language=Simplify_Chinese \
  --with-maxfd=65535 \
  --with-aio \
  --disable-poll \
  --enable-epoll \
  --enable-linux-netfilter \
  --enable-large-cache-files \
  --disable-ident-lookups \
  --enable-default-hostsfile=/etc/hosts \
  --with-dl \
  --with-large-files \
  --enable-delay-pools \
  --enable-snmp \
  --disable-internal-dns

  make && make install
}

function set_config(){
  rm -rf /usr/local/squid/etc/squid.conf
  cat <<EOF > /usr/local/squid/etc/squid.conf
http_port 80 transparent

#cache_replacement_policy lru  #如果有多个（下面两行）缓存目录，则需要写这个参数
cache_dir aufs  /cache1 128 4 32  #缓存目录1 /cache1 大小为128M
#cache_dir aufs /cache2 128 4 32  #缓存目录2 /cache2 大小为128M

## 上面两行定义了缓存目录，这个缓存目录可以只有一个，也可以定义很多个。
cache_mem 256 MB  #分配多少内存给squid，建议留至少512M给系统，如果你是虚拟机内存很小，只作为试验用的话，那就分一半内存给squid
maximum_object_size 2048 KB  #缓存的文件最大不能超过2M
maximum_object_size_in_memory 512 KB #缓存在内存中的文件最大不超过512k
visible_hostname cache.example.com  #显示给用户的主机名
client_persistent_connections off  #client端关闭长连接
server_persistent_connections on  #server端打开长连接
memory_pools on
memory_pools_limit 1024 MB
forwarded_for on
log_icp_queries off
cache_mgr  cache@example.com  #定义管理员的mail为cache@example.com
via on
httpd_suppress_version_string off
cache_effective_user squid   #定义以squid用户的身份运行squid
cache_effective_group squid
error_directory /usr/local/squid/share/errors/Simplify_Chinese
icon_directory /usr/local/squid/share/icons
mime_table /usr/local/squid/etc/mime.conf
ie_refresh off
tcp_recv_bufsize 32 KB

acl all src 0.0.0.0/0.0.0.0
acl localhost src 127.0.0.0/8
acl Mgr_ip src 127.0.0.0/8
acl allow_ip dst 127.0.0.0/8  192.168.0.0/16  #定义允许代理的web的IP或者IP段
acl PURGE method PURGE
acl Safe_ports port 80 8080
acl CONNECT method CONNECT
acl manager proto cache_object
acl HTTP proto HTTP

http_access allow allow_ip
http_access allow manager Mgr_ip
http_access deny manager
http_access deny PURGE
http_access deny !Safe_ports
http_access deny all
icp_access deny all
ipcache_size 1024
ipcache_low 90
ipcache_high 95
memory_replacement_policy lru
hosts_file /etc/hosts
request_header_max_size 128 KB
hierarchy_stoplist cgi-bin ? \.php \.html
acl QUERY urlpath_regex cgi-bin \? \.php \.html
cache deny QUERY
quick_abort_min -1 KB
quick_abort_max 32 KB
quick_abort_pct 95
# error page
#error_map http://www.92csz.com/404.html 403
#deny_info http://www.92csz.com/error.html cctv_Domain
# timeout
peer_connect_timeout 20 seconds
connect_timeout 20 seconds
read_timeout 60 seconds
request_timeout 20 seconds
pconn_timeout 20 seconds
shutdown_lifetime 5 seconds
strip_query_terms off
icp_port 0
# logfile
emulate_httpd_log on
logformat combined %>a %ui %un [%tl] "%rm %ru HTTP/%rv" %Hs %<st "%{Referer}>h" "%{User-Agent}>h" %Ss:%Sh
#access_log /log/squid-log/access.log combined
cache_store_log /dev/null
cache_log /var/log/squid/cache.log
logfile_rotate 12
# MISCELLANEOUS
store_objects_per_bucket 15
client_db off
EOF
}

# 初始化squid
function init() {
  rm -rf /cache1 /cache2 /var/log/squid
  mkdir /cache1 /cache2 /var/log/squid
  chown -R squid:squid /cache1 /cache2 /var/log/squid
  #如果你的配置文件配置出错，往往会在初始化的时候报错，错误信息会直接显示在屏幕上。初始化成功后，就可以启动squid了
  /usr/local/squid/sbin/squid -z
}

function start() {
    nohup /usr/local/squid/bin/RunCache &
}

function start_onboot() {
    echo "/usr/local/bin/RunCache &" >> /etc/rc.d/rc.local
}

# 如果是一台web上的多个域名，请不要写一行，虽然hosts是允许的，但是如果写成一个IP对应多个域名，squid代理时就会出错。所以有几个域名就要写几行。
function restart() {
    # 重启前检查
    exec_command "/usr/local/squid/sbin/squid  -kcheck"
    #重启
    if [[ $PIPESTATUS ]];then
      /usr/local/squid/sbin/squid  -krec
    fi
}


install
set_config
init
start