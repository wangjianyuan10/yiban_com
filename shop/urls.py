from django.conf.urls import url

from shop import views

urlpatterns=[
    url(r"shop/(?P<productid>\d+)/$",views.shop,name='shop')
]