import sys

from django.core.files.uploadedfile import InMemoryUploadedFile
from django.db import models
from garpix_utils.file.file_field import get_file_path
from ..mixins import TimestampMixin
from django.conf import settings
from PIL import Image
from django.core.validators import FileExtensionValidator
from ..validator import FileSizeValidator
import os
from io import BytesIO


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
        max_length=200,
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

    def save(self,*args, **kwargs):
        output_thumb = BytesIO()
        img = Image.open(self.image)
        img_name, ext = os.path.splitext(self.image.name)
        output_size = self.thumbnail_size(img.size)

        img.thumbnail(output_size)
        img.save(output_thumb, format='WebP')

        self.thumbnail = InMemoryUploadedFile(
            output_thumb,
            'ImageField',
            f"{img_name}_thumb.webp",
            'image/webp',
            sys.getsizeof(output_thumb),
            None
        )

        super().save(*args, **kwargs)

    @staticmethod
    def get_top_images(count=10):
        top_albums = Album.objects.order_by('-views')[:count]
        return top_albums

    def get_title(self):
        return self.title

    def get_author(self):
        return self.author

    def get_views(self):
        return self.views

    def increment_views(self):
        self.views += 1
        self.save()

    @staticmethod
    def thumbnail_size(image_size):
        max_size = 150
        width, height = image_size
        try:
            if width > height:
                thumbnail_width = max_size
                thumbnail_height = int((height / width) * max_size)
            else:
                thumbnail_width = int((width / height) * max_size)
                thumbnail_height = max_size
            thumbnail_size = (thumbnail_width, thumbnail_height)

            return thumbnail_size

        except Exception as e:
                print(f"Error creating thumbnail: {e}")
                return None
