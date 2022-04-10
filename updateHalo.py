# -*- coding: UTF-8 -*-
from bs4 import BeautifulSoup
import requests
import os

def getVersion():
    try:
        #获取网页源代码
        response = requests.get(url='https://halo.run/')
        bs = BeautifulSoup(response.text, "html.parser")
        #获取最近版本
        newVersionList = bs.find_all(name='meta', attrs={'name': 'generator'})[0]['content']
        newVersion = str(newVersionList).split(' ')[1]
    except:
        print('获取最新版本失败！')
        exit()

    try:
        #获取自己当前版本
        myResponse = requests.get(url='MYURL')
        bs = BeautifulSoup(myResponse.text, "html.parser")
        myVersion = bs.find_all(name='meta', attrs={'name': 'generator'})[0]['content']
        oldVersion = str(myVersion).split(' ')[1]
    except:
        print('获取自己版本失败!')
        exit()

    if oldVersion != newVersion:
        os.system('cd /root/autoUpdateHalo/ && ./updateHaloLinux.sh '+newVersion)
    else:
        print('已是最新版本')

if __name__ == '__main__':
    getVersion()
