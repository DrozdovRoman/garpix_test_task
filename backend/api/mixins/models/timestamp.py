from django.db import models
from django.utils import timezone


class TimestampMixin(models.Model):
    created_at = models.DateTimeField(
        default=timezone.now,
        editable=False,
        verbose_name='Создано')

    class Meta:
        abstract = True
