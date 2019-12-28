from django.conf.urls import url

from user import views

urlpatterns=[
    url(r'login/',views.login,name="login"),
    url(r'logout/',views.logout,name='logout'),
    url(r'register/',views.register,name='register'),
    url(r'imgcode/',views.imgcode,name='imgcode'),
    url(r'sendmsg/',views.sendmsg,name='sendmsg'),
    url(r'verifyphone/',views.verifyphone,name='verifyphone'),
    url(r'pay/',views.pay,name='pay')
]