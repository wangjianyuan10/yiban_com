import json
import time

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from django_redis import get_redis_connection

from home.models import YibanSku
from order.models import Order
from user.models import YibanUser


def order(request):
    if request.method=='GET':
        user1 = None
        if request.session.get('id'):
            uid = request.session.get('id')
            user1 = YibanUser.objects.get(id=uid)
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
            return render(request, 'orderdetail.html', context)
        else:
            return redirect('/login/')
    elif request.method=='POST':
        if request.session.get('id'):
            uid=request.session.get('id')
            user1 = YibanUser.objects.get(id=uid)
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
            return JsonResponse({'code':'ok','msg':'sucess'})
        else:
            return redirect('/login/')


    elif request.method=='PUT':
        requestdict=json.loads(request.body)
        phone=requestdict.get('phone')
        address=requestdict.get('address')
        userid=requestdict.get('userid')
        username=requestdict.get('username')
        user1=YibanUser.objects.get(id=int(userid))
        redis_cli=get_redis_connection('cart')
        redis_json_data = redis_cli.get(f'redis_data_{userid}') if redis_cli.get(f'redis_data_{userid}') else '{}'
        redis_data = json.loads(redis_json_data)
        skudicts = {}
        for skuid, num in redis_data.items():
            try:
                sku = YibanSku.objects.get(id=int(skuid))
                skuprops=sku.product.longname+sku.skuprops
                skudicts[skuprops] = num

            except Exception as e:
                return HttpResponse(str(e))

        Order.objects.create(uid=int(userid),order_code=userid+str(time.time()),order_detail=json.dumps(skudicts)\
                             ,toaddress=address,phone=phone,tousername=username)


        return JsonResponse({'code':'ok','message':'ok'})

