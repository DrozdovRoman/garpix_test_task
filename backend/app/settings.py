from garpixcms.settings import *  # noqa

INSTALLED_APPS += [  # noqa
    'api',
]

MIGRATION_MODULES.update({  # noqa:F405
    'fcm_django': 'app.migrations.fcm_django'
})

GARPIX_USER.update({
    'USE_REGISTRATION': True,
    'REGISTRATION_SERIALIZER': 'app.serializers.RegistrationCustSerializer',
    'MIN_LENGTH_PASSWORD': 8,
    'MIN_DIGITS_PASSWORD': 2,
    'MIN_CHARS_PASSWORD': 2,
    'MIN_UPPERCASE_PASSWORD': 1,

    'REST_AUTH_TOKEN_JWT': True,
    'JWT_SECRET_KEY': env('JWT_SECRET_KEY'),
    'JWT_SERIALIZER': 'garpix_user.serializers.JWTDataSerializer',

})



