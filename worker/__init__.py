import os

from celery import Celery

from worker import config

# 加载django的环境
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "yiban0.settings")

# 实例化celery
celery_app = Celery('yiban')

# 加载配置文件
celery_app.config_from_object(config)

# 自动注册任务
celery_app.autodiscover_tasks()