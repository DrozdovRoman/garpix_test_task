from django.urls import reverse
from django.core.files.uploadedfile import SimpleUploadedFile
from six import BytesIO
from PIL import Image
import pytest

from api.models import Album


class TestAlbumApi:

    @pytest.mark.django_db(transaction=True)
    def test_albums_get_not_auth(self, client):
        url = reverse('album-list')
        response = client.get(url)

        assert response.status_code == 401

    @pytest.mark.django_db(transaction=True)
    def test_albums_get(self, user_client, album1, another_album):
        url = reverse('album-list')
        response = user_client.get(url)

        assert response.status_code == 200

        test_data = response.json()

        assert type(test_data) == list

        assert len(test_data) == Album.objects.count()

        album = Album.objects.all()[0]
        test_album = test_data[0]

        assert 'id' in test_album
        assert 'title' in test_album
        assert 'author' in test_album
        assert 'image' in test_album
        assert 'thumbnail' in test_album
        assert 'views' in test_album

        assert test_album['id'] == album.id

    @pytest.mark.django_db(transaction=True)
    def test_album_create(self, user_client, user, another_user):
        url = reverse('album-list')
        album_count = Album.objects.count()

        data = {}
        response = user_client.post(url, data=data)
        assert response.status_code == 400

        image = BytesIO()
        Image.new('RGB', (100, 100)).save(image, 'JPEG')
        image.seek(0)
        image = SimpleUploadedFile('image.JPG', image.getvalue())

        data = {
            'title': 'Созданная фотография',
            'image': image,
        }
        response = user_client.post(url, data=data)
        assert response.status_code == 201

        test_data = response.json()
        assert type(test_data) == dict

        assert test_data.get('title') == data['title']

        assert album_count + 1 == Album.objects.count()

    @pytest.mark.django_db(transaction=True)
    def test_album_get_current(self, user_client, album1, user, another_album, another_user):
        url = reverse('album-detail', args=[album1.id])
        response = user_client.get(url)

        assert response.status_code == 200

        test_data = response.json()
        assert test_data.get('title') == album1.title

        assert test_data.get('username') == user.username

        assert test_data.get('views') == album1.views + 1

        url = reverse('album-detail', args=[another_album.id])
        response = user_client.get(url)

        assert response.status_code == 200

        test_data = response.json()
        assert test_data.get('title') == another_album.title

        assert test_data.get('username') == another_user.username

        assert test_data.get('views') == another_album.views + 1

    @pytest.mark.django_db(transaction=True)
    def test_album_delete_current(self, user_client, album1, another_album):
        url = reverse('album-detail', args=[album1.id])
        response = user_client.delete(url)

        assert response.status_code == 204

        test_album = Album.objects.filter(id=album1.id).first()
        assert not test_album

        url = reverse('album-detail', args=[another_album.id])
        response = user_client.delete(url)

        assert response.status_code == 403
