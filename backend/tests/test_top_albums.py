import pytest
from django.urls import reverse
from api.models import TopAlbums


class TestTopAlbums:
    @pytest.mark.django_db(transaction=True)
    def test_albums_get_not_auth(self, client):
        url = reverse('top-albums')
        response = client.get(url)

        assert response.status_code == 401

    @pytest.mark.django_db(transaction=True)
    def test_albums_get(self, user_client, album1, another_album):
        url = reverse('top-albums')
        response = user_client.get(url)

        assert response.status_code == 200

        assert TopAlbums.objects.count() == 1

        response = user_client.get(url)

        assert response.status_code == 200

        assert TopAlbums.objects.count() == 1
