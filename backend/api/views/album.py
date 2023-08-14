from rest_framework import generics
from ..models import Album
from ..serializers import AlbumSerializer


class AlbumListView(generics.ListAPIView):
    queryset = Album.objects.all()
    serializer_class = AlbumSerializer
