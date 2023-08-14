from rest_framework import serializers
from ..models import Album


class AlbumSerializer:
    class Meta:
        model = Album
        fields = '__all__'
