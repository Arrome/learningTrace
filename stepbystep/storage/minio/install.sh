#!/bin/bash

# 服务端启动 `minio server /data`
#export MINIO_ACCESS_KEY=minioadmin
#export MINIO_SECRET_KEY=minioadmin
docker run -dp 9000:9000 --name minio \
  --user $(id -u):$(id -g) \
  -e "MINIO_ACCESS_KEY=minioadmin" -e "MINIO_SECRET_KEY=minioadmin" \
  -v ${HOME}/data:/data \
  minio/minio server /data



# 客户端
docker run -it --entrypoint=/bin/sh minio/mc