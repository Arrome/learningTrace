set -xe

function exec_command() {
    $1 || exit "${PIPESTATUS}"
}

function install_hadoop() {
    if [[ ! -f /root/hadoop-2.10.0.tar.gz ]];then
      wget -O /root/hadoop-2.10.0.tar.gz http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.10.0/hadoop-2.10.0.tar.gz
    fi
    rm -rf /opt/hadoop-2.10.0
    tar -zxvf /root/hadoop-2.10.0.tar.gz -C /opt
}

function install_java() {
  exec_command "yum install -y java-1.8.0-openjdk-1.8.0.232.b09-0.el7_7.x86_64 java-1.8.0-openjdk-devel-1.8.0.232.b09-0.el7_7.x86_64"
}

function create_user() {
    grep -E "^hadoop" /etc/group >& /dev/null
    if [[ $PIPESTATUS ]];then
      groupadd hadoop
    fi
    if [[ `id hdfs >& /dev/null` ]];then
      useradd -g hadoop hdfs
    fi
    if [[ `id yarn >& /dev/null` ]];then
      useradd -g hadoop yarn
    fi
}

install_hadoop
install_java
create_user