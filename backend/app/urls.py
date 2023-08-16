from garpixcms.urls import *  # noqa

urlpatterns = [
    path(f'{settings.API_URL}/', include('api.urls')),
] + urlpatterns  # noqa