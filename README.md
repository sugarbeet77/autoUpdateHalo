# 自动升级Halo系统

**前提**：

1、需要有python3环境（python2.7应该不行）

2、**需要和官网的部署一样就可以用**，如果有不同地方可以根据需要修改shell脚本中的命令

**准备：**

1、安装脚本需要的库文件

```
pip3 install -r requirement.txt
```

2、给脚本权限

```
chmod 777 test.py
chmod 777 updateHalo.py
chmod 777 updateHaloLinux.sh或chmod 777 updateHaloDocker.sh
```

3、将updateHalo.py和test.py代码中的MYURL替换为自己的博客主页地址，例：`myResponse = requests.get(url='https://xxxx')`
```
 #获取自己当前版本
    myResponse = requests.get(url=MYURL)
```
根据实际需求使用linux或docker的shell脚本，`os.system('cd /home/halo/autoUpdateHalo && ./updateHaloLinux.sh '+newVersion)`，更改python文件中的shell文件名即可（**注意：shell文件名后面有一个空格**）。

这里提供了test.py，可以先运行test.py，如果能正常返回，自己和最新版本、需要更新或已是最新版本就说明正常，可以直接使用。



**使用**

```
python3 updateHalo.py
```





**简单说明**

python是用来检测是否需要更新

shell是用来执行具体更新命令



**最后**

最后根据需要可以设定定时任务，每天执行一次实时监控。

```
#从0点开始每隔10分钟执行脚本，检测是否需要更新，并将错误日志打印到auto.log中
/10 0 * * * root python3 /home/halo/autoUpdateHalo/updateHalo.py 2> /home/halo/autoUpdateHalo/auto.log
```
