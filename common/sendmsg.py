import requests
from django.http import JsonResponse
from django_redis import get_redis_connection
from worker import celery_app
import random

def create_sms(num):
    start_num = 10**(num-1)
    end_num = 10**num - 1
    return random.randint(start_num, end_num)
@celery_app.task
def send_sms(phone):
    # 2,发送短信
    url = 'https://open.ucpaas.com/ol/sms/sendsms'

    # 随机的验证码
    code = create_sms(4)

    json_data = {
        "sid": "8036ece41e07ea5340794286185f9214",
        "token": "8a9c9099eb825ea314bcb620f9fdbc6b",
        "appid": "43accec098df4aaa85a6e4004c802e6f",
        "templateid": "517556",
        "param": f"{code}, 180",
        "mobile": phone,
    }

    res = requests.post(url, json=json_data)

    # 接收返回的json数据
    con = res.json()

    if con.get('code') == '000000':
        # 把验证码保存在redis里面
        redis_cli = get_redis_connection()
        redis_cli.set(f'smscode-{phone}', code, 180)

        return JsonResponse({'code': 0, 'msg': '验证码发送成功'})
    else:
        # 记录错误日志
        return JsonResponse({'code': 100, 'msg': '验证码发送失败'})
