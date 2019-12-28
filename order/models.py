from django.db import models

# Create your models here.
class Order(models.Model):
    uid = models.IntegerField(verbose_name="用户id")
    order_code = models.CharField(max_length=100, verbose_name="订单编号")
    order_detail=models.CharField(max_length=1000,verbose_name='订单详情')
    status = models.SmallIntegerField(default=1, verbose_name="1未支付,2已支付，未发货")
    toaddress=models.CharField(max_length=100,verbose_name='订单地址',default='')
    phone=models.CharField(max_length=30,verbose_name='手机',default='')
    tousername=models.CharField(max_length=50,verbose_name='收货人姓名',default='')


    class Meta:
        db_table = 'yiban_order'

