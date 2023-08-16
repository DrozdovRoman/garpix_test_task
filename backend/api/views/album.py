from rest_framework import status, generics
from rest_framework.generics import get_object_or_404
from rest_framework.pagination import PageNumberPagination
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from ..models import Album
from ..serializers import AlbumSerializer


class UserAlbumView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        albums = Album.objects.filter(author=user)

        page_size = request.GET.get('page_size', 5)
        page_number = request.GET.get('page', 1)

        paginator = PageNumberPagination()
        paginator.page_size = page_size

        albums_page = paginator.paginate_queryset(albums, request)

        serializer = AlbumSerializer(albums_page, many=True)

        response_data = {
            'count': albums.count(),
            'page': paginator.page.number,
            'page_size': page_size,
            'results': serializer.data,
        }

        return Response(response_data)

    def post(self, request):
        user = request.user
        data = request.data

        data['author'] = user.id

        serializer = AlbumSerializer(data=data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserImageView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, title):
        user = request.user

        album = get_object_or_404(Album, title=title, author=user)
        album.increment_views()

        serializer = AlbumSerializer(album)
        return Response(serializer.data)

    def delete(self, request, title):
        user = request.user

        album = get_object_or_404(Album, title=title, author=user)

        album.delete()

        return Response(status=status.HTTP_204_NO_CONTENT)


class ImageView(generics.RetrieveAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = AlbumSerializer
    lookup_field = 'title'

    def get_queryset(self):
        user = self.kwargs['user']
        return Album.objects.filter(author__username=user)


class AlbumView(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = AlbumSerializer
    pagination_class = PageNumberPagination

    def get_queryset(self):
        user = self.kwargs['user']
        return Album.objects.filter(author__username=user)
