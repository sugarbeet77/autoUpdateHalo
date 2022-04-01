from bs4 import BeautifulSoup
import requests

def getVersion():
    try:
        #获取网页源代码
        response = requests.get(url='https://docs.halo.run/')
        bs = BeautifulSoup(response.text, "html.parser")
        #获取最近版本
        newVersion = bs.find_all(name='a', attrs={'class': 'navbar__link'})[2].get_text()
        print('最新版本:\t'+newVersion)
    except:
        print('获取最新版本失败！')
        exit()

    try:
        #获取自己当前版本
        myResponse = requests.get(url='MYURL')
        bs = BeautifulSoup(myResponse.text, "html.parser")
        myVersion = bs.find_all(name='meta', attrs={'name': 'generator'})[0]['content']
        oldVersion = str(myVersion).split(' ')[1]
        print('自己版本:\t'+oldVersion)
    except:
        print('获取自己版本失败!')
        exit()

    if oldVersion != newVersion:
        print('需要更新')
    else:
        print('已是最新版本')


if __name__ == '__main__':
    getVersion()