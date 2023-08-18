from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from ..serializers import AlbumCreateSerializer, AlbumSuccesfullCreateSerializer


class AlbumCreateView(APIView):
    def post(self, request):
        serializer = AlbumCreateSerializer(data=request.data, context={'request': request})

        if serializer.is_valid():
            album = serializer.save()
            response_serializer = AlbumSuccesfullCreateSerializer(album, context={'request': request})
            return Response(response_serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
