from django.urls import include, path
from .views import UserAlbumView, UserImageView, ImageView, AlbumView



urlpatterns = [
    path('album/<str:user>/<str:title>/', ImageView.as_view(), name='user-album-detail'),
    path('album/<str:user>/', AlbumView.as_view(), name='user-album-list'),
    path('album/me', UserAlbumView.as_view(), name='album-list'),
    path('album/me/<str:title>/', UserImageView.as_view(), name='album-detail'),
]
