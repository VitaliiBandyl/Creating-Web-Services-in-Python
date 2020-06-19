"""django_routing URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin

from . import views

urlpatterns = [
    url(r'^simple_route/$', views.simple_route),
    url(r'^slug_route/([a-z0-9-_]{1,16})/$', views.slug_route),
    url(r'^sum_route/(-?\d+)/(-?\d+)/$', views.sum_route),
    url(r'^sum_get_method/$', views.sum_get_method),
    url(r'^sum_post_method/$', views.sum_post_method),
]
