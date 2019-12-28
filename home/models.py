from datetime import datetime
from django.db import models

# Create your models here.


# 定义基类模型, 抽象的模型类是不会生成迁移表结构
class BaseModel(models.Model):
    # flask  __abstract__ = True
    img = models.CharField(max_length=255, verbose_name="图片路径")
    name = models.CharField(max_length=64, verbose_name="图片名称",null=True)
    datetime = models.DateTimeField(verbose_name="图片日期",default='2019-8-8')
    source = models.CharField(max_length=255,verbose_name="图片来源",default='/')

    # 把 模型类变成一个抽象的类
    class Meta:
        abstract = True
# 导航模型类


class Shop(models.Model):
    shopname=models.CharField(max_length=255,verbose_name="店铺名称")
    class Meta:
        abstract=True




class ProductBaseModel(BaseModel):
    skudict = models.CharField(max_length=255,verbose_name="sku",default='{"color":["red",],"size":["L","M","S"]}')
    # category=models.CharField(max_length=255,verbose_name="类目树")
    productimg=models.CharField(max_length=255,verbose_name="商品图片集",default='/')
    # shopid= models.ForeignKey(Shop,related_name="products",)
    #shortname=models.CharField(max_length=15,verbose_name="短名称")
    longname=models.CharField(max_length=60,verbose_name="长名称")
    brandname= models.CharField(max_length=255,verbose_name="品牌名称",default='尚丝蔓')
    # brandlogo= models.CharField(max_length=255,verbose_name="品牌logo",default=None)
    # uploaddate= models.DateTimeField(verbose_name="上传日期")
    # props=models.CharField(max_length=255,verbose_name="商品属性表")
    mainprice=models.DecimalField(max_digits=9,decimal_places=2,verbose_name='商品主价格',default=99)
    class Meta:
        abstract= True
    def __str__(self):
        return self.longname
class ProductSkuModel(models.Model):
    skuprops=models.CharField(max_length=255,verbose_name="sku属性")
    primaryprice = models.DecimalField(max_digits=9,decimal_places=2,verbose_name="原价")
    discountprice = models.DecimalField(max_digits=9,decimal_places=2,verbose_name="折扣价")
    inventory= models.IntegerField(verbose_name="库存")
    sales = models.IntegerField(verbose_name="销量")

    class Meta:
        abstract= True
    def __str__(self):
        return self.skuprops

class Nav(BaseModel):
    class Meta:
        db_table = 'yiban_nav'
class YibanBrandNav(BaseModel):
    class Meta:
        db_table = 'yiban_brand_nav'

class Wheel(BaseModel):
    class Meta:
        db_table = 'yiban_wheel'
class YibanShop(Shop):
    class Meta:
        db_table="yiban_shop"

class YibanProduct(ProductBaseModel):
    shopid=models.ForeignKey(YibanShop,related_name="products",on_delete=models.CASCADE,default=1)
    class Meta:
        db_table= "yiban_product"
class YibanManProduct(ProductBaseModel):
    shopid=models.ForeignKey(YibanShop,related_name="manproducts",on_delete=models.CASCADE,default=1)
    class Meta:
        db_table= "yiban_man_product"
class YibanKidsProduct(ProductBaseModel):
    shopid=models.ForeignKey(YibanShop,related_name="kidsproducts",on_delete=models.CASCADE,default=1)
    class Meta:
        db_table= "yiban_kids_product"
class YibanDiscountProduct(ProductBaseModel):
    shopid=models.ForeignKey(YibanShop,related_name="discountproducts",on_delete=models.CASCADE,default=1)
    discountprice = models.DecimalField(max_digits=9,decimal_places=2,verbose_name='商品折扣价格',default=89)
    discount=models.DecimalField(max_digits=3,decimal_places=1,verbose_name='商品折扣价格',default=9.9)
    class Meta:
        db_table= "yiban_discount_product"

class YibanSku(ProductSkuModel):

    product=models.ForeignKey(YibanDiscountProduct,related_name="skus",on_delete=models.CASCADE)
    class Meta:
        db_table= "yiban_sku"

















