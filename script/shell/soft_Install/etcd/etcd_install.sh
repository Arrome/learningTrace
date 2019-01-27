#!/bin/bash
usage(){
  echo "usage: $0 FILE_NAME_ETCD_TAR_GZ"
  echo "       $0 etcd-v3.3.11-linux-arm64.tar.gz"
  echo "Get etcd binary from: https://github.com/etcd-io/etcd/releases"
  echo "eg: wget https://github.com/etcd-io/etcd/releases/etcd-v3.3.11-linux-arm64.tar.gz"
  echo ""
}

SYSTEMDDIR=/usr/lib/systemd/system
SERVICEFILE=etcd.service
ETCDDIR=/usr/bin
ETCDBIN=etcd
SERVICENAME=etcd

if [ $# -ne 1 ];then
  usage
  exit 1
else
  FILETARGZ="$1"
fi

if [ ! -f ${FILETARGZ} ];then
  echo "etcd binary tgz files does not exist,please check it"
  echo "Get etcd binary from: https://github.com/etcd-io/etcd/releases"
  echo "eg: wget https://github.com/etcd-io/etcd/releases/etcd-v3.3.11-linux-arm64.tar.gz"
  exit 1
fi

echo "##unarchive ${FILETARGZ}"
tar xvpf ${FILETARGZ}
echo ""

FILETARGZNAME=${FILETARGZ#*/}
FILETARGZNAME=${FILETARGZNAME:0:-7}
echo "filetargz's name:${FILETARGZNAME}"

echo "##binary : ${ETCDBIN} copy to ${ETCDDIR}"
cp -p ${FILETARGZNAME}/etcd* ${ETCDDIR} >/dev/null 2>&1
which ${ETCDBIN}

echo "##config etcd.config info to /etc/etcd/etcd.conf"
mkdir -p /etc/etcd
mkdir -p /var/lib/etcd/default.etcd
NETWORKCARDNAME="ens33"
HOSTIPADDR=${HOSTIPADDR:=$(ip addr| grep ${NETWORKCARDNAME} | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')}
cat >/etc/etcd/etcd.conf <<EOF
ETCD_NAME="etcd"
ETCD_DATA_DIR="/var/lib/etcd/default.etcd"
ETCD_LISTEN_PEER_URLS="http://0.0.0.0:2380"
ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"

ETCD_INITIAL_ADVERTISE_PEER_URLS="http://${HOSTIPADDR}:2380"
ETCD_INITIAL_CLUSTER="etcd=http://${HOSTIPADDR}:2380"
ETCD_INITIAL_CLUSTER_STATE="new"
ETCD_INITIAL_CLUSTER_TOKEN="etcd-cluster"
ETCD_ADVERTISE_CLIENT_URLS="http://${HOSTIPADDR}:2379"
EOF

echo "##create systemd service: ${SYSTEMDDIR}/${SERVICEFILE}"
mkdir -p /var/lib/etcd
cat >${SYSTEMDDIR}/${SERVICEFILE} <<EOF
[Unit]
Description=Etcd Server
After=network.target
[Service]
Type=simple
WorkingDirectory=/var/lib/etcd
EnvironmentFile=-/etc/etcd/etcd.conf
ExecStart=/usr/bin/etcd \
        --name=\${ETCD_NAME} \
        --data-dir=\${ETCD_DATA_DIR} \
        --listen-peer-urls=\${ETCD_LISTEN_PEER_URLS} \
        --listen-client-urls=\${ETCD_LISTEN_CLIENT_URLS} \
        --advertise-client-urls=\${ETCD_ADVERTISE_CLIENT_URLS} \
        --initial-advertise-peer-urls=\${ETCD_INITIAL_ADVERTISE_PEER_URLS} \
        --initial-cluster=\${ETCD_INITIAL_CLUSTER} \
        --initial-cluster-token=\${ETCD_INITIAL_CLUSTER_TOKEN} \
        --initial-cluster-state=\${ETCD_INITIAL_CLUSTER_STATE}
Type=notify
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

echo "##service status:${SERVICENAME}"
systemctl status ${SERVICENAME}

echo "##service restart:${SERVICENAME}"
systemctl restart ${SERVICENAME}

echo "##service enabled:${SERVICENAME}"
systemctl enable ${SERVICENAME}

echo "##etcd version"
etcd --version
