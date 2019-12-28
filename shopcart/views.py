import json

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django_redis import get_redis_connection

from home.models import YibanSku
from user.models import YibanUser


def shopcart(request):
    if request.method=='GET':
        user1=None
        if request.session.get('id'):
            uid=request.session.get('id')
            user1=YibanUser.objects.get(id=uid)
            redis_cli = get_redis_connection('cart')
            redis_json_data = redis_cli.get(f'redis_data_{uid}') if redis_cli.get(f'redis_data_{uid}') else '{}'
            redis_data = json.loads(redis_json_data)
            carttotal = sum(redis_data.values())
            skudicts = {}
            for skuid, num in redis_data.items():
                try:
                    sku = YibanSku.objects.get(id=int(skuid))
                    skudicts[sku] = num

                except Exception as e:
                    return HttpResponse(str(e))
            context = {
                'user1': user1,
                'skudicts': skudicts,
                'carttotal': carttotal
            }
            return render(request, 'SHOP_Cart.html', context)

        else:
            pass


    if request.method=='POST':
        return HttpResponse('ok')


def shopaddress(request):
    user1=None
    if request.session.get('id'):
        uid=request.session.get('id')
        user1=YibanUser.objects.get(id=uid)
    context={
        'user1':user1
    }
    return render(request,'shopaddress.html',context)