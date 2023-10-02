from django.conf import settings
from django.utils.module_loading import import_string
from celery.schedules import crontab
from .models import Album

from garpix_notify.models import Notify


celery_app = import_string(settings.GARPIX_NOTIFY_CELERY_SETTINGS)


@celery_app.task
def periodic_top_views_email_notification():
    albums = Album.get_top_images(count=3)
    for album in albums:
        if album.author.email:
            Notify.send(
                settings.MOST_VIEWED_ALBUM_EVENT,
                {'album': album},
                user=album.author
            )


celery_app.conf.beat_schedule.update({
    'Test_task': {
        'task': 'api.tasks.periodic_top_views_email_notification',
        'schedule': crontab(day_of_month='1'),
    }
})
celery_app.conf.timezone = 'UTC'
