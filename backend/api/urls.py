from rest_framework.routers import DefaultRouter
from django.urls import include, path
from .views import AlbumViewSet, TopAlbumsView

router = DefaultRouter()
router.register('album', AlbumViewSet)

urlpatterns = [
    path('top-albums', TopAlbumsView.as_view(), name='top-albums'),
    path('', include(router.urls))
]
