from ..models import TopAlbums
from django.contrib import admin
from django.contrib.admin import ModelAdmin


@admin.register(TopAlbums)
class TopAlbumsAdmin(ModelAdmin):
    list_display = ('id', 'hash_key', 'webm_file', 'created_at')
