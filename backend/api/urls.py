# from django.urls import include, path
# from .views import AlbumCreateView, AlbumListView, AlbumDeleteView
#
#
# urlpatterns = [
#     path('album/create/', AlbumCreateView.as_view(), name='album-create'),
#     path('album/', AlbumListView.as_view(), name='album-list'),
#     path('album/<int:id>/', AlbumDeleteView.as_view(), name='album-delete'),
# ]


from rest_framework.routers import DefaultRouter
from django.urls import include, path
from .views import AlbumViewSet

router = DefaultRouter()
router.register('album', AlbumViewSet)

urlpatterns = [
    path('', include(router.urls))
]