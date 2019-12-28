from django import template
register=template.Library()
@register.filter
def plus(key,big):
    return key*big
