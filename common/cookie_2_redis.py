import json

from django_redis import get_redis_connection


def cookie_2_redis(request, response):
    '''

    逻辑：
    如果cookie中的数据存在与redis中，那么就覆盖
    如果不存在就添加
    '''

    # 1，判断cookie中有没有数据，如果没有不做任何操作
    # 如果有数据，就操作
    json_cookie_data = request.COOKIES.get('cart')
    print(json_cookie_data)
    if json_cookie_data:

        uid = request.session.get('id')
        print('----',uid,'=---')
        # 2,取redis中的数据
        redis_cli = get_redis_connection('cart')
        json_redis_data = redis_cli.get(f'redis_data_{uid}')

        # 3,redis中的数据是否存在
        if not json_redis_data:
            # 4，如果不存在，就直接把cookie的数据赋值给redis
            json_redis_data = json_cookie_data
            print(json_redis_data)
        else:
            # 如果存在, 把cookie和redis中的数据转成字典
            cookie_data = json.loads(json_cookie_data)
            redis_data = json.loads(json_redis_data)

            # 如果cookie中的数据存在与redis中，那么就覆盖.如果不存在就添加
            redis_data.update(cookie_data)
            json_redis_data = json.dumps(redis_data)

        # 删除cookie中的值
        response.delete_cookie('cart')

        # 重新设置redis的值
        redis_cli.set(f'redis_data_{uid}', json_redis_data)


    # 返回响应对象
    return response