from django.db import models
from garpix_utils.file.file_field import get_file_path
from ..mixins import TimestampMixin
from django.conf import settings
from PIL import Image
from django.core.validators import FileExtensionValidator
from ..validator import FileSizeValidator
import os


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
        validators=[
            FileExtensionValidator(settings.WHITELISTED_IMAGE_TYPES),
            FileSizeValidator(settings.UPLOAD_FILE_MAX_SIZE)
        ],
        verbose_name='Изображение'
    )

    thumbnail = models.ImageField(
        upload_to=get_file_path,
        null=True,
        blank=True,
        verbose_name='Миниатюрное изображение'
    )

    views = models.PositiveIntegerField(default=0, verbose_name='Просмотры')

    class Meta:
        unique_together = ('title', 'author',)
        ordering = ['-created_at']
        verbose_name = 'Фотография'
        verbose_name_plural = 'Фотографии'

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        if self.image:
            create_thumbnail(self.image.path)
            # super().save(*args, **kwargs)

    @staticmethod
    def get_top_ten_images(self):
        top_photos = Album.objects.order_by('-views')[:10]
        return top_photos

    @staticmethod
    def get_top_ten_author_images(self, author):
        top_photos = Album.objects.filter(author=author).order_by('-views')[:10]
        return top_photos

    def get_title(self):
        return self.title

    def get_author(self):
        return self.author

    def get_views(self):
        return self.views

    def increment_views(self):
        self.views += 1
        self.save()


def create_thumbnail(image_path):
    image = Image.open(image_path)

    max_thumbnail_size = 150

    width, height = image.size

    if width > height:
        thumbnail_size = (max_thumbnail_size, int(height * (max_thumbnail_size / width)))
    else:
        thumbnail_size = (int(width * (max_thumbnail_size / height)), max_thumbnail_size)

    image.thumbnail(thumbnail_size)
    thumbnail_path = f'{image_path.split(".")[:-1]}_thumbnail.{image_path.split(".")[-1]}'
    image.save(thumbnail_path, format='WebP')
    print(thumbnail_path)
    # return thumbnail_path

