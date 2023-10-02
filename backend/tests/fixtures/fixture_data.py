import pytest


@pytest.fixture
def album1(user):
    from api.models import Album
    return Album.objects.create(
        author=user,
        title='Моя фотография 1',
        image='test/test_image_1.jpeg',
        views=10
    )


@pytest.fixture
def album2(user):
    from api.models import Album
    return Album.objects.create(
        author=user,
        title='Моя фотография 2',
        image='test/test_image_2.jpeg',
        views=25
    )


@pytest.fixture
def another_album(another_user):
    from api.models import Album
    return Album.objects.create(
        author=another_user,
        title='Чужая фотография',
        image='test/another_test_image.jpeg'
    )
