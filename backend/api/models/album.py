from django.db import models
from garpix_utils.file.file_field import get_file_path
from ..mixins import TimestampMixin
from django.db.models.constraints import UniqueConstraint
from django.conf import settings


class Album(TimestampMixin, models.Model):
    title = models.CharField(
        max_length=200,
        verbose_name='Название'
    )

    author = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        verbose_name='Автор'
    )

    image = models.ImageField(
        upload_to=get_file_path,
        verbose_name='Изображение'
    )

    class Meta:
        constraints = [
            UniqueConstraint(
                fields=('author', 'title'),
                name='Это название уже занято',
            )
        ]
        ordering = ['-created_at']
        verbose_name = 'Фотография'
        verbose_name_plural = 'Фотографии'

    def __str__(self):
        return self.title

    def get_title(self):
        return self.title

    def get_author(self):
        return self.author
