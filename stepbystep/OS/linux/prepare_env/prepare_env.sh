
function exec_command() {
    $1 || exit "${PIPESTATUS}"
}

function set_network() {
    sed -i "/^ONBOOT/c\ONBOOT=yes" /etc/sysconfig/network-scripts/ifcfg-ens33
    systemctl restart network
}

function close_firewalld() {
    systemctl stop firewalld
    systemctl disable firewalld
}
# 关闭分区
function close_swap() {
    # swapoff -a
    sed -i 's/.*swap.*/#&/' /etc/fstab
}

function set_yum_repo() {
    # install epel
    exec_command "curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo"

    # install aliyun
    cat <<EOF > /etc/yum.repos.d/aliyun.repo
[aliyun_extra]
name=CentOS-$releasever - aliyun_extra
baseurl=http://mirrors.aliyun.com/centos/7/os/x86_64
gpgcheck=0
EOF
}

function install_base_tools() {
    exec_command "yum install -y wget"
    exec_command "yum install -y net-tools"
    exec_command "yum install -y java-1.8.0-openjdk-1.8.0.232.b09-0.el7_7.x86_64 java-1.8.0-openjdk-devel-1.8.0.232.b09-0.el7_7.x86_64"
}

function set_java_env() {
    if [ ! -f /etc/profile.d/java.sh ];then
      echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk" >> /etc/profile.d/java.sh
    fi
    source /etc/profile.d/java.sh
    echo "export PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile
    source /etc/profile
}

#set_network
close_firewalld
close_swap
set_yum_repo
install_base_tools
set_java_env