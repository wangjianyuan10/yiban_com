import os
import re

from alipay import AliPay
from django.contrib.auth.hashers import make_password, check_password
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse
from django_redis import get_redis_connection

from common import send_sms, cookie_2_redis
from common.captcha.captcha import captcha
from order.models import Order
from user.models import YibanUser
from yiban0 import settings


def login(request):
    if request.method == 'GET':
        if not request.session.get("id"):
            return render(request, 'land.html', {'msg': '',"username":""})
        else:
            #:TODO
            print(request.session.get("id"))
            return redirect("/index/")
    elif request.method == 'POST':
        # 1,获取数据
        username = request.POST.get('username')
        password = request.POST.get('password')
        # imgcode = request.POST.get('imgcode')
        # 2,判断数据

        # 2.0 判断数据都不能为空
        if not all([username, password]):
            return render(request, 'land.html', {'msg': '选项不能为空',"username":username})

        # 2.1 判断用户名是否存在
        try:
            print(username,password)
            user = YibanUser.objects.get(username=username)
            print(username,password,user.password)
        except YibanUser.DoesNotExist:
            return render(request, 'land.html', {'msg': '用户不存在请注册',"username":username})


        # 2.2 判断密码是否正确
        if not check_password(password, user.password):
        # if password != user.password:
            return render(request, 'land.html', {'msg': '用户名或者密码错误',"username":username})

        # 2.3 判断验证码
        # if imgcode.lower() != request.session.get('imgcode').lower():
        #     return render(request, 'login.html', {'msg': '验证码错误'})

        # 处理逻辑
        # 用session保存用户的登陆状态
        # request.session['id'] = user.id
        request.session['id'] =user.id


        response = redirect('/index/')

        # 合并cookie和redis的数据
        res = cookie_2_redis(request, response)

        return response

def logout(request):
    del request.session['id']
    return redirect('/index/')


def register(request):
    if request.method=='GET':
        if request.session.get('id'):
            context={'msg':''}
            return redirect(reverse('home:index'))
        context = {'msg': ''}
        return render(request,'register.html',context)
    elif request.method=='POST':
        user_=request.POST.get('name')
        pwd= request.POST.get('pwd')
        imgcode=request.POST.get('imgcode')
        if not all([user_,pwd,imgcode]):
            return JsonResponse({'code':'error','msg':'用户名、密码、验证码不能为空'})
        if not re.match(r'^[a-zA-Z0-9_\u4e00-\u9fa5]+$',user_):
            return  JsonResponse({'code':'error','msg':'用户名必须由6-50位字符，中文、数字、字母或者"-"组合'})
        if not re.match(r'^([a-z_A-Z-.+0-9]+)$',pwd):
            return JsonResponse({'code':'error','msg':'密码为6-20个字符，请用英文加数字或下划线组合！'})
        if not imgcode==request.session.get('imgcode'):
            return JsonResponse({'code':'error','msg':'验证码错误'})
        try:
            user1=YibanUser.objects.get(username=user_)
            return JsonResponse({'code':'error','msg':'用户名已存在'})
        except:
            password=make_password(pwd)
            user2=YibanUser.objects.create(username=user_,password=password)
            request.session['id']=user2.id
            return JsonResponse({'code':'ok','msg':'success'})
def imgcode(request):
    """
    <input name="imgcode" type="text" class="form-control" id="imgcode_input" placeholder="请输入验证码" style="width:80px; float: left; margin-top: 10px">
    <img id="imgcode" src="/imgcode/" width="120" height="60" style="float:left;display: block;" >
    <script>
    $(function(){
        $('#imgcode').click(function(){ $(this).attr('src', '/imgcode/?' + Math.random())})
    })
    </script>
    """

    name, text, bin_data = captcha.generate_captcha()

    # 把图片里面的文字保存在session里面，session用redis保存
    request.session['imgcode'] = text

    return HttpResponse(bin_data)


def sendmsg(request):
    phone = request.POST.get('phone')

    # 把任务放到队列里面
    send_sms.delay(phone)
    return JsonResponse({'msg': '短信验证码发送成功'})


def verifyphone(request):
    uid=request.session.get('id')
    phone=request.POST.get('phone')
    sms=request.POST.get('sms')
    redis_cli = get_redis_connection()
    print(sms)
    redis_code = redis_cli.get(f'smscode-{phone}')
    if not redis_code:
        return JsonResponse({'code':'expire','msg': '验证码过期'})

    if redis_code.decode() != sms:
        return JsonResponse({'code':'error','msg': '验证码错误'})
    YibanUser.objects.filter(id=uid).update(phone=phone,is_active=True)
    return JsonResponse({'code':'success','msg':'成功'})
def paydata(request, order_code):

    order = Order.objects.get(order_code=order_code)

    return render(request, 'orderdetail.html', {'order': order})




def pay(request, order_code):

    app_private_key_string = open(os.path.join(settings.BASE_DIR, "alipay/app_private_key.pem")).read()
    alipay_public_key_string = open(os.path.join(settings.BASE_DIR, "alipay/alipay_public_key.pem")).read()

    alipay = AliPay(
        appid='2016092700609211',
        app_notify_url=None,
        # app_private_key_path=os.path.join(settings.BASE_DIR, "alipay/app_private_key.pem"),
        # alipay_public_key_path=os.path.join(settings.BASE_DIR, "alipay/alipay_public_key.pem"),
        app_private_key_string=app_private_key_string,
        alipay_public_key_string=alipay_public_key_string,
        sign_type="RSA2",
        debug=True
    )

    order = Order.objects.get(order_code=order_code)

    # 生成登录支付宝连接
    order_string = alipay.api_alipay_trade_page_pay(
        out_trade_no=order_code,
        total_amount=order.total_amount,
        subject='axf订单',
        return_url='http://127.0.0.1:8000/alipayback/',
    )

    alipay_url = 'https://openapi.alipaydev.com/gateway.do?' + order_string
    return redirect(alipay_url)





def alipayback(request):
    query_dict = request.GET
    data = query_dict.dict()

    print(data)
    # 获取并从请求参数中剔除signature
    signature = data.pop('sign')

    app_private_key_string = open(os.path.join(settings.BASE_DIR, "alipay/app_private_key.pem")).read()
    alipay_public_key_string = open(os.path.join(settings.BASE_DIR, "alipay/alipay_public_key.pem")).read()

    # 创建支付宝支付对象
    alipay = AliPay(
        appid='2016092700609211',
        app_notify_url=None,  # 默认回调url
        app_private_key_string=app_private_key_string,
        alipay_public_key_string=alipay_public_key_string,
        sign_type="RSA2",
        debug=True
    )
    # 校验这个重定向是否是alipay重定向过来的
    success = alipay.verify(data, signature)
    if success:
        #	验证成功
        # 生成支付记录，改变订单状态
        order_code = data.get('out_trade_no')
        Order.objects.filter(order_code=order_code).update(status=2)
        return redirect(reverse('user:info'))
    else:
        # 验证失败
        print('no')
        return HttpResponse('支付失败')