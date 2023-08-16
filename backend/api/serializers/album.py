from rest_framework import serializers
from ..models import Album


class AlbumSerializer(serializers.ModelSerializer):
    created_at = serializers.DateTimeField(format='%d.%m.%Y %H:%M')

    class Meta:
        model = Album
        fields = [
            'created_at',
            'title',
            'image',
            'views'
        ]
