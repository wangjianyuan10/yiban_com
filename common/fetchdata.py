from bs4 import BeautifulSoup
# import re
# def bs4parse(path,css):
#     htmlfile=open("E:/programs/flask/BlogPro/app/templates/blog/index.html","r",encoding="utf-8")
#     htmltext=htmlfile.read()
#     soup=BeautifulSoup(htmltext,"html.parser")
#     a=soup.select(".r_box>li>h3>a")
#     p=soup.select(".r_box>li>p")
#     alist=[i.text for i in a]
#     plist=[i.text for i in p]
#     content=zip(alist,plist)
#     return content
def bs4parse(path,css):
    htmlfile=open(path,"r",encoding="utf-8")
    htmltext=htmlfile.read()
    soup=BeautifulSoup(htmltext,"html.parser")
    a=soup.select(css)
    return [i.text for i in a]
    




