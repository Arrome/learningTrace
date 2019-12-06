
# 关联脚本：
#   install_docker.sh

workdir=$(dirname readlink -f "$0")

function exec_command() {
    $1 || exit "${PIPESTATUS}"
}

# k8s 仓库
function set_k8s_repo() {
    cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg,http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
}

function install_docker() {
    wget https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz
    bash "${workdir}"/install_docker.sh
}

function install_kubeadm() {
    exec_command "yum install -y kubelet kubeadm kubectl"
    exec_command "systemctl enable kubelet.service"
    exec_command "systemctl restart kubelet.service"
}

function set_net_bridge() {
    echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
}


set_k8s_repo
set_net_bridge
install_docker
install_kubeadm
