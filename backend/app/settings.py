from garpixcms.settings import *  # noqa

INSTALLED_APPS += [  # noqa
]

MIGRATION_MODULES.update({  # noqa:F405
    'fcm_django': 'app.migrations.fcm_django'
})
