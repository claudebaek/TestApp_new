# -*- coding: utf-8 -*- 
# parser.py
import requests
from requests import get
import urllib3
import sys
import os.path
import re
from bs4 import BeautifulSoup as bs
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
urllib3.disable_warnings()

def download(url, file_name = None):
    if not file_name:
        file_name = url.split('/')[-1]

    with open(file_name, "wb") as file:
        response = get(url)
        file.write(response.content)
        return response
        

def getCsrftoken(req):
    soup = bs(req.text, 'html.parser')
#    csrfmiddlewaretoken = soup.find('input', {'name': 'csrfmiddlewaretoken'})
    csrfmiddlewaretoken = soup
    return csrfmiddlewaretoken

def deploy(test):

#    versionCode = ''.join(re.findall('\d+',versionName))

    print('로그인 진입')

    # 로그인 유저정보
#    LOGIN_INFO = {
#        'account_name_text_field': 'dreamusCompanyIOS@gmail.com',
#        'password_text_field': 'Abwlrapdlxm201999'
#    }

    LOGIN_INFO = {
        'id': 'doosan03211',
        'pw': 'entks!123'
        }

#    LOGINURL = 'http://appstoreconnect.apple.com/login'
    LOGINURL = 'http://nid.naver.com/nidlogin.login'
#    LOGINURL = 'http://naver.com'

    BUILDURL = 'https://appstoreconnect.apple.com/apps/1129048043/recent/activity/ios/builds?m='
#    BUILDURL = 'https://appstoreconnect.apple.com/'

    DOWNLOADURL = 'http://iosapps.itunes.apple.com/itunes-assets/Purple124/v4/0b/2a/bb/0b2abb49-b620-c9e4-0ed5-9c57df2a3759/appDsyms.zip?accessKey=1594826615_3139411280017662167_%2Bw9W%2Fmx7M%2Ba77I41C%2FtuqmqHqsSADOvJjfFJlkK2ngb%2FW6roDklqCEm1h4d9WQJdtaqpqTjJ4EoiB7cQRccbiCQKpWPqDCYPn7ibCvAmjFDaZQBuuFdAG0ttKknBfNM0K9UzQgfze6zW3pC9ZX6MuSWu9uIrSkA6lkq8z3rbN94%3D'
    
    'http://iosapps.itunes.apple.com/itunes-assets/Purple114/v4/39/cb/31/39cb3113-cd3b-5cc1-ff7a-d6d08bad37d9/appDsyms.zip?accessKey=1594897221_8021814428782408016_%2BK4qZbdPVJd27r1mS5tZczW7J%2BbDT%2BM8uisR1tDlHVTkwWMZy7xh77ifqYqs1oE0soRGvV7lbqgrdnhKvbLG%2FIML7NXr68q5S5LYnJV%2FsZ1dVnMinhlw%2FLpvHqnZvU2GC7417tvnRQwq4R89cQFHgm7ez5pLEY20tkjrsvWFtWw%3D'

    
    # Session 생성, with 구문 안에서 유지
    with requests.Session() as s:
        
        #LOGIN GET
        login_get_req = s.get(LOGINURL)
        print("login_get_req: ",login_get_req.status_code)
#        csrfmiddlewaretoken = getCsrftoken(login_get_req)
        
        #LOGIN POST
#        LOGIN_INFO = {**LOGIN_INFO}
        login_post_req = s.post(LOGINURL,data=LOGIN_INFO, verify=True)
#        login_post_req = s.get(LOGINURL)
        print(login_post_req.content)
#        login_post_req = s.post(LOGINURL, auth=('dreamusCompanyIOS@gmail.com','Abwlrapdlxm20190'), verify = False)

        print(login_post_req.status_code)
        if login_post_req.status_code != 200:
            raise Exception('로그인이 되지 않았어요! 아이디와 비밀번호를 다시한번 확인해 주세요.')
        print('로그인성공')

        #deploy Get
        deployreq = s.get(LOGINURL)
        csrfmiddlewaretoken = getCsrftoken(deployreq)
#        print(csrfmiddlewaretoken)

        print('dsym 다운로드 시작')

        res = download(DOWNLOADURL, 'appDsyms.zip')
        
        print(res)
        
        if res.status_code != 200:
            raise Exception('다운로드 실패')
        print('다운로드 성공')
        
        #deploy POST
#        path,ipafileanme = os.path.split(ipafilepath)
#        print(ipafileanme)
#        files = {'csrfmiddlewaretoken':(None,csrfmiddlewaretoken),
#            'bundle_identifier':(None,bundle_identifier),
#            'short_description':(None,short_description),
#            'description':(None,'versionName : ' + versionName+'\nversionCode : ' + versionCode),
#            'version':(None,versionName),
#            'tags':(None,tag),#12 dev3 #9 kona-c #1 release
#            'ipa_file': (ipafileanme,open(ipafilepath,'rb'),'application/octet-stream')}
#        print('파일업로드 시작')
#        s.post(DEPOLYURL,files=files,verify='ios_deploy_cert.pem',headers=dict(referer = DEPOLYURL))
        


def main(argv):
#    if len(argv) <= 3:
#        print('버전, ipafilefullpath, tag, target 순서로 입력해주세요')
#        exit(2)
#
#    filefullpath = '../'+argv[1]+'.ipa'
#    if os.path.isfile(filefullpath) == False:
#        print('버전, ipafilefullpath, tag, target 순서로 입력해주세요')
#        print('없는 파일에 접근하였습니다.')
#        exit(2)
#
#    if argv[2] == 'distribution':
        deploy('test')
#    elif argv[2] == 'real_deploy':
#        deploy('v'+argv[0],filefullpath,'9',argv[3])
#    elif argv[2] == 'staging':
#        deploy('v'+argv[0]+'-staging',filefullpath,'1',argv[3])
#    else:
#        print('버전, ipafilefullpath, tag, target 순서로 입력해주세요')
#        print('tag에는 branch명으로 \"master\"는 dev3(12),\"real_deploy\"는 kona-c(9)입니다. 괄호는 deploy center에서 사용하는 tag number 입니다.')
#        exit(2)

if __name__ == "__main__":
    main(sys.argv[1:])



