#!/bin/bash

NEWVERSION=$1

function stop_f () {
    echo -e "正在停止halo服务..."
    stop=`docker stop halo`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 成功！\e[0m"
       else
       echo -e "\e[31m 失败！\e[0m"
       exit
       fi
}

function del_f () {
    echo -e "正在删除halo容器..."
    stop=`docker rm -f halo`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 删除成功！\e[0m"
       else
       echo -e "\e[31m 删除失败！\e[0m"
       exit
       fi
}

function bak_f1 () {
    echo -e "正在备份halo配置文件..."
    bakfile1=`cp -r /home/halo/.halo /home/halo/.halo.archive`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 备份成功！\e[0m"
       else
       echo -e "\e[31m 备份失败！\e[0m"
       exit
       fi
}

function download_f () {
    echo -e "正在拉取最新的 Halo 镜像..."
    bakfile=`docker pull halohub/halo:$NEWVERSION`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 拉取成功！\e[0m"
       else
       echo -e "\e[31m 拉取失败！\e[0m"
       exit
       fi   
}

function start_f () {
    echo -e "正在创建容器..."
    start=`docker run -it -d --name halo -p 8090:8090 -v /home/halo/.halo:/root/.halo --restart=unless-stopped halohub/halo:$NEWVERSION`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 创建成功！\e[0m"
       else
       echo -e "\e[31m 创建失败！\e[0m"
       exit
       fi
}


stop_f
del_f
bak_f1
download_f
start_f

