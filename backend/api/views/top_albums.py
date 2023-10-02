from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from ..models import TopAlbums
from ..serializers import TopAlbumsSerializer
from django.shortcuts import get_object_or_404
from django.contrib.auth import get_user_model


class TopAlbumsView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        User = get_user_model()
        user_id = request.query_params.get('user_id')

        if user_id:
            user = get_object_or_404(User, id=user_id)
            albums_webm = TopAlbums.get_top_albums_webm(user)
        else:
            albums_webm = TopAlbums.get_top_albums_webm()

        serializer = TopAlbumsSerializer(albums_webm)
        return Response(serializer.data, status=status.HTTP_200_OK)
