from ..models import Album
from django.contrib import admin
from django.contrib.admin import ModelAdmin


@admin.register(Album)
class AlbumAdmin(ModelAdmin):
    list_display = ('id', 'author', 'title')
