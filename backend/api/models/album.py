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

    def save(self, *args, **kwargs):

        if self.image:
            thumbnail_path = self.create_thumbnail(self.image)
            self.thumbnail.name = thumbnail_path
        super().save(*args, **kwargs)

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

    @staticmethod
    def create_thumbnail(image):
        try:
            file, ext = os.path.splitext(image.name)
            max_size = 150
            with Image.open(image) as im:
                width, height = im.size
                if width > height:
                    thumbnail_width = max_size
                    thumbnail_height = int((height / width) * max_size)
                else:
                    thumbnail_width = int((width / height) * max_size)
                    thumbnail_height = max_size
                size = (thumbnail_width, thumbnail_height)

                im.thumbnail(size)
                thumbnail_file_name = f"{str(os.path.basename(file)).lower()}-thumbnail.webp"
                thumbnail_path = get_file_path(Album, thumbnail_file_name)

                im.save(os.path.join(settings.MEDIA_ROOT, thumbnail_path), "WebP")

            return thumbnail_path

        except Exception as e:
            print(f"Error creating thumbnail: {e}")
            return None
