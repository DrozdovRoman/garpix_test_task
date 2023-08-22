from garpixcms.settings import *  # noqa

API_URL = 'api/v1'

INSTALLED_APPS += [  # noqa
    'api',
]

MIGRATION_MODULES.update({  # noqa:F405
    'fcm_django': 'app.migrations.fcm_django'
})

GARPIX_USER.update({
    'USE_REGISTRATION': True,
    'MIN_LENGTH_PASSWORD': 8,
    'MIN_DIGITS_PASSWORD': 2,
    'MIN_CHARS_PASSWORD': 2,
    'MIN_UPPERCASE_PASSWORD': 1,

    'REST_AUTH_TOKEN_JWT': True,
    'JWT_SECRET_KEY': env('JWT_SECRET_KEY'),
    'JWT_SERIALIZER': 'garpix_user.serializers.JWTDataSerializer',

})

WHITELISTED_IMAGE_TYPES = ['png', 'jpeg', 'jpg']
UPLOAD_FILE_MAX_SIZE = 5 * 1024 * 1024

MOST_VIEWED_ALBUM_EVENT = 1

NOTIFY_EVENTS = {
    MOST_VIEWED_ALBUM_EVENT: {
        'title': 'Топ-3 самых просматриваемых фотографий на сайте'
    }
}

CHOICES_NOTIFY_EVENT = [(k, v['title']) for k, v in NOTIFY_EVENTS.items()]