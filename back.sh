#!/bin/bash 
WORK_PATH='/usr/projects/back'
cd $WORK_PATH
echo "先清除老代码"
git reset --hard origin/master
git clean -f
echo "拉取新代码"
git pull origin master
echo "开始执行构建后端项目:back为docker镜像名称 1.0为版本号"
docker build -t back:1.0 .
echo "停止旧容器 并删除旧容器"
docker stop back-container
docker rm back-container
echo "启动新容器"
docker container run -p 3000:3000 --name back-container -d back:1.0