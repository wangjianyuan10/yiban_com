import json

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.

from django.views import View

from common import bs4parse
from user.models import YibanUser
from home.models import Nav, YibanProduct, YibanManProduct, YibanKidsProduct, Wheel, YibanDiscountProduct, YibanBrandNav


class indexview(View):
    def get(self,request):
        user1=None
        if request.session.get('id'):
            uid=request.session.get('id')
            user1=YibanUser.objects.get(id=uid)
        navs=Nav.objects.all()
        shangsiman_product=YibanProduct.objects.filter(brandname='尚丝蔓')
        gedi_product=YibanProduct.objects.filter(brandname='哥弟')
        ROOM0404_product=YibanProduct.objects.filter(brandname='ROOM0404')
        luoluokaer_product=YibanProduct.objects.filter(brandname='洛洛卡儿')
        shangsiman_man_product=YibanManProduct.objects.filter(brandname='尚丝蔓')
        gedi_man_product=YibanManProduct.objects.filter(brandname='哥弟')
        ROOM0404_man_product=YibanManProduct.objects.filter(brandname='ROOM0404')
        luoluokaer_man_product=YibanManProduct.objects.filter(brandname='洛洛卡儿')
        shangsiman_kids_product = YibanKidsProduct.objects.filter(brandname='尚丝蔓')
        gedi_kids_product = YibanKidsProduct.objects.filter(brandname='哥弟')
        ROOM0404_kids_product = YibanKidsProduct.objects.filter(brandname='ROOM0404')
        luoluokaer_kids_product = YibanKidsProduct.objects.filter(brandname='洛洛卡儿')
        yiban_wheels=Wheel.objects.all()
        yiban_discount_products=YibanDiscountProduct.objects.all()
        yiban_brandnavs=YibanBrandNav.objects.all()
        context={
                'user1':user1,
                'navs':navs,
                'shangsimans':shangsiman_product,
                'gedis':gedi_product,
                'room404s':ROOM0404_product,
                'luoluokaers':luoluokaer_product,
                'shangsimans_mans':shangsiman_man_product,
                'gedi_mans':gedi_man_product,
                'room404_mans':ROOM0404_man_product,
                'luoluokaer_mans':luoluokaer_man_product,
                'shangsiman_kids':shangsiman_kids_product,
                'gedi_kids':gedi_kids_product,
                'ROOM0404_kids':ROOM0404_kids_product,
                'luoluokaer_kids':luoluokaer_kids_product,
                'yibanwheels':yiban_wheels,
                'discountproducts':yiban_discount_products,
                'brandnavs':yiban_brandnavs
            }
        return render(request,"index.html",context)





def create(request):
    # aaa=open('/Users/mac/PycharmProjects/yiban0/static/aaa2.json').read()
    # aaa=json.loads(aaa)
    # print(aaa)
    # for i in aaa:
    #     for j in i:
    #         YibanKidsProduct.objects.create(img=j['img'],longname=j['shop'],mainprice=j['price'][1:])
    # aaa=open('/Users/mac/PycharmProjects/yiban0/static/LBTY.json').read()
    # aaa=json.loads(aaa)
    # for i in aaa:
    #     Wheel.objects.create(img=i.get('img'))
    # aaa=open('/Users/mac/PycharmProjects/yiban0/static/shop.json').read()
    # aaa=json.loads(aaa)
    # for i in aaa:
    #     YibanDiscountProduct.objects.create(img=i['img'],mainprice=i['old_price'][1:],longname=i['shop'],discountprice=i['price'][1:],discount=i['discount'][:-1])
    aaa=open('/Users/mac/PycharmProjects/yiban0/static/warpY.json').read()
    aaa=json.loads(aaa)
    for i in aaa:
        YibanBrandNav.objects.create(img=i['img'])

    return HttpResponse('ok')