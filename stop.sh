CONTAINER_NAME=autogo
IMAGE_NAME=crpi-5tzwiznwaw34lfca.cn-guangzhou.personal.cr.aliyuncs.com/aseubel/autogo:latest
PORT=611

echo "容器部署开始 ${CONTAINER_NAME}"

# 停止容器
docker stop ${CONTAINER_NAME}

# 删除容器
docker rm ${CONTAINER_NAME}

docker rmi ${IMAGE_NAME}