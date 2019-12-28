from django.db import models

class User(models.Model):
    username = models.CharField(max_length=20, verbose_name="用户名")
    password = models.CharField(max_length=100, verbose_name="密码")
    phone = models.CharField(max_length=11, verbose_name="手机号")
    email = models.EmailField(default='', max_length=50, verbose_name="邮箱")
    avatar = models.CharField(max_length=100, verbose_name="头像路径")
    address=models.CharField(max_length=255,verbose_name='收货地址',default='广东深圳市后瑞地铁站西部硅谷')
    is_active = models.BooleanField(default=False, verbose_name="邮箱是否激活")

    class Meta:
        abstract=True
class YibanUser(User):
    class Meta:
        db_table="yiban_user"
        verbose_name="买家用户"