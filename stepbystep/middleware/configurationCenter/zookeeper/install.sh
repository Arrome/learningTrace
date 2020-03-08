
function exec_command() {
    $1 || exit "$PIPESTATUS"
}

function prepare_env() {
    exec_command "yum install -y java"
}

function download_untar() {
    exec_command "wget http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.5.6/apache-zookeeper-3.5.6-bin.tar.gz"
    tar -zxvf apache-zookeeper-3.5.6-bin.tar.gz -C /opt
}

function set_config() {
    cp /opt/apache-zookeeper-3.5.6-bin/conf/zoo_sample.cfg /opt/apache-zookeeper-3.5.6-bin/conf/zoo.cfg
    echo "server.1=hadoop1:2888:3888" >> /opt/apache-zookeeper-3.5.6-bin/conf/zoo.cfg
    echo "server.2=hadoop2:2888:3888" >> /opt/apache-zookeeper-3.5.6-bin/conf/zoo.cfg
    echo "server.3=hadoop3:2888:3888" >> /opt/apache-zookeeper-3.5.6-bin/conf/zoo.cfg
    data_dir_line=`sed -n '/^dataDir/p' zoo.cfg`
    data_dir=${data_dir_line#=*}
    if [[ -d ${data_dir} ]];then
      mkdir -p ${data_dir}
    fi
    # hadoop1节点
    echo 1 > ${data_dir}/myid
    # hadoop2节点 echo 2 > ${data_dir}/myid
    # hadoop3节点 echo 3 > ${data_dir}/myid

}


prepare_env
download_untar
set_config