from garpixcms.urls import *  # noqa

urlpatterns = [
    path('api/', include('api.urls', namespace='api')),
] + urlpatterns  # noqa