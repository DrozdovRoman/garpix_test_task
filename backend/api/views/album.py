from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from ..models import Album
from ..serializers import AlbumCreateSerializer, AlbumSerializer, AlbumUpdateTitleSerializer
from rest_framework import filters, viewsets
from ..permissions import IsOwnerOrReadOnly


class AlbumViewSet(viewsets.ModelViewSet):
    queryset = Album.objects.all()
    serializer_class = AlbumSerializer
    permission_classes = (IsOwnerOrReadOnly, IsAuthenticated)
    filter_backends = [filters.SearchFilter]
    search_fields = ['title', 'author__username']

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)

    def create(self, request, *args, **kwargs):
        serializer = AlbumCreateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        instance = serializer.instance
        album_serializer = AlbumSerializer(instance)
        return Response(album_serializer.data, status=status.HTTP_201_CREATED)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increment_views()
        response = super().retrieve(request, *args, **kwargs)
        return Response(response.data)

    def partial_update(self, request, *args, **kwargs):
        instance = self.get_object()

        serializer = AlbumUpdateTitleSerializer(instance, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        album_serializer = AlbumSerializer(instance)

        return Response(album_serializer.data)

    def perform_update(self, serializer):
        instance = self.get_object()
        previous_fields = {
            'author': instance.author,
            'image': instance.image,
            'thumbnail': instance.thumbnail,
            'views': instance.views,
        }

        serializer.save(**previous_fields)
        instance.refresh_from_db()
