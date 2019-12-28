from django.conf.urls import url

from shopcart import views

urlpatterns=[
    url(r'shopcart/$',views.shopcart,name='shopcart'),
    url(r'shopcart/address/',views.shopaddress,name='address')
]