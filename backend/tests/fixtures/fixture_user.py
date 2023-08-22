import pytest

@pytest.fixture
def user(django_user_model):
    data_user = {
        'username': 'test',
        'email': 'test@garpix.com',
        'password': 'BlaBla123',
        'first_name': 'Ivan',
        'last_name': 'Ivanov',
    }
    return django_user_model.objects.create_user(**data_user)

@pytest.fixture
def another_user(django_user_model):
    data_user = {
        'username': 'AnotherUser',
        'email': 'another_user@garpix.com',
        'password': 'BlaBla123',
        'first_name': 'Another',
        'last_name': 'User',
    }
    return django_user_model.objects.create_user(**data_user)

@pytest.fixture
def user_client(user):
    from rest_framework.test import APIClient

    client = APIClient()
    client.force_authenticate(user)
    return client