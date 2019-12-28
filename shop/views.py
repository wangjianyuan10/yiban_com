import json

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from django_redis import get_redis_connection

from home.models import YibanDiscountProduct, YibanSku
from user.models import YibanUser


def shop(request,productid):
    if request.method=='GET':
        user1 = None
        cart = request.COOKIES.get('cart', {})
        if cart :
            cart=json.loads(cart)
        carttotal = sum(cart.values())
        if request.session.get('id'):
            uid = request.session.get('id')
            user1 = YibanUser.objects.get(id=uid)
            redis_cli=get_redis_connection('cart')
            redis_json_data=redis_cli.get(f'redis_data_{uid}') if redis_cli.get(f'redis_data_{uid}') else '{}'
            redis_data = json.loads(redis_json_data)
            carttotal=sum(redis_data.values())
        try:
            product=YibanDiscountProduct.objects.get(id=productid)
            print(product)
            productimgs=product.productimg.split(';')
            print(productimgs)

            skudict=json.loads(product.skudict)
            colors=skudict.get('color')
            sizes=skudict.get('size')
            skus=product.skus.all()
            store=sum([sku.inventory for sku in skus])
        except:
            return HttpResponse('this product do not exist!')
        context={
            'product':product,
            'colors':colors,
            'sizes':sizes,
            'store':store,
            "productimgs":productimgs,
            'user1':user1,
            'skus':skus,
            'carttotal':carttotal
        }
        return render(request,'Shop.html',context=context)
    if request.method=='POST':
        user1=None
        if request.session.get('id'):
            uid = request.session.get('id')
            user1 = YibanUser.objects.get(id=uid)
        skupro=request.POST.get('skupro')
        skuprodict=json.dumps({'color':skupro.split(';')[0],'size':skupro.split(';')[1]})
        print(skuprodict)
        skuid=YibanSku.objects.filter(skuprops=skuprodict)[0].id
        num = request.POST.get('num')
        print(num)

        if not user1:
            cart = request.COOKIES.get('cart', {})
            if cart:
                cart = json.loads(cart)
            print(cart)
            cart[str(skuid)] = cart.get(str(skuid), 0) + int(num)
            carttotal = sum(cart.values())
            cartjson = json.dumps(cart)
            res=JsonResponse({'code': 'ok', 'msg': carttotal})
            res.set_cookie('cart',cartjson)
            return res
        else:
            redis_cli=get_redis_connection('cart')
            json_redis_data = redis_cli.get(f'redis_data_{uid}') if redis_cli.get(f'redis_data_{uid}') else '{}'
            print(json_redis_data)
            redis_data=json.loads(json_redis_data)
            if num:
                redis_data[str(skuid)] = redis_data.get(str(skuid), 0) + int(num)
            else:
                redis_data.pop(str(skuid))
            carttotal=sum(redis_data.values())
            json_redis_data=json.dumps(redis_data)
            redis_cli.set(f'redis_data_{uid}',json_redis_data)
            return JsonResponse({'code':'ok','msg':carttotal})





