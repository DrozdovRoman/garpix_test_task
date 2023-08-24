from rest_framework import serializers
from ..models import TopAlbums


class TopAlbumsSerializer(serializers.ModelSerializer):
    created_at = serializers.DateTimeField(format='%d.%m.%Y %H:%M:%S')

    class Meta:
        model = TopAlbums
        fields = '__all__'
