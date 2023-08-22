from django.conf import settings
from django.utils.module_loading import import_string
from celery.schedules import crontab
from .models import Album

from garpix_notify.models import Notify


celery_app = import_string(settings.GARPIX_NOTIFY_CELERY_SETTINGS)


@celery_app.task
def periodic_top_views_email_notification():
    authors = Album.get_top_three_images_author()
    for author in authors:
        if author.email:


        else:
            print(None)


celery_app.conf.beat_schedule.update({
    'Test_task': {
        'task': 'api.tasks.periodic_top_views_email_notification',
        # 'schedule': crontab(minute=0, hour=0, day_of_month=1, month_of_year='*'),
        'schedule': 5,
    }
})
celery_app.conf.timezone = 'UTC'
