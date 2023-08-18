# created_at = serializers.DateTimeField(format='%d.%m.%Y %H:%M')
from rest_framework import serializers
from ..models import Album


class AlbumCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Album
        fields = ['title', 'image']

    def create(self, validated_data):
        validated_data['author'] = self.context['request'].user
        return super().create(validated_data)


class AlbumSuccesfullCreateSerializer(serializers.HyperlinkedModelSerializer):
    username = serializers.ReadOnlyField(source="author.username")
    created_at = serializers.DateTimeField(format='%d.%m.%Y %H:%M:%S')

    class Meta:
        model = Album
        fields = ['username', 'title', 'image', 'thumbnail', 'created_at']
