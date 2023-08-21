from rest_framework import serializers
from ..models import Album


class AlbumCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Album
        fields = ['title', 'image']


class AlbumUpdateTitleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Album
        fields = ['title']


class AlbumSerializer(serializers.ModelSerializer):
    username = serializers.ReadOnlyField(source="author.username")
    created_at = serializers.DateTimeField(format='%d.%m.%Y %H:%M:%S')

    class Meta:
        model = Album
        fields = '__all__'
