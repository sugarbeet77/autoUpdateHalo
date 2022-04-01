#!/bin/bash

NEWVERSION=$1

function stop_f () {
    echo -e "正在停止halo服务..."
    stop=`service halo stop`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 成功！\e[0m"
       else
       echo -e "\e[31m 失败！\e[0m"
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

function bak_f2 (){
    echo -e "正在备份halo.jar文件..."
    bakfile2=`mv /home/halo/app/halo.jar /home/halo/app/halo.jar.archive`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 备份成功！\e[0m"
       else
       echo -e "\e[31m 备份失败！\e[0m"
       exit
       fi
}

function download_f () {
    echo -e "正在下载..."
    bakfile=`cd /home/halo/app && wget https://dl.halo.run/release/halo-$NEWVERSION.jar -O halo.jar`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 下载成功！\e[0m"
       else
       echo -e "\e[31m 下载失败！\e[0m"
       exit
       fi
}

function start_f () {
    echo -e "正在开启halo服务..."
    start=`service halo start`
    if [ $? -eq 0 ]; then
       echo -e "\e[32m 启动成功！\e[0m"
       else
       echo -e "\e[31m 启动失败！\e[0m"
       exit
       fi
}


stop_f
bak_f1
bak_f2
download_f
start_f
