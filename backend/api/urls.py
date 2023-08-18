from django.urls import include, path
from .views import AlbumCreateView


urlpatterns = [
    path('album/create/', AlbumCreateView.as_view(), name='album-create'),
]
