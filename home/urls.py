from django.conf.urls import url

from home import views

urlpatterns=[

    url("^$",views.indexview.as_view(),name="index"),
    url("^index/",views.indexview.as_view(),name="index"),
    url("^create/",views.create,name='create')
]