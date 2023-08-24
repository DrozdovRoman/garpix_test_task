from django.db import models
from ..mixins import TimestampMixin
from ..models import Album
from garpix_utils.file.file_field import get_file_path
from ..utils import calculate_hash_string

import os
import cv2

from io import BytesIO
from django.core.files import File
from django.conf import settings


class TopAlbums(TimestampMixin, models.Model):
    hash_key = models.CharField(
        max_length=64,
        unique=True,
        verbose_name='Хэш ключ'
    )

    webm_file = models.FileField(
        upload_to=get_file_path,
        max_length=200,
        verbose_name='Топ-10 просматриваемых фото'
    )

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Топ фотографий'
        verbose_name_plural = 'Топ фотографий'

    def __str__(self):
        return self.hash_key

    @staticmethod
    def get_top_albums_webm(user=None):

        top_albums = Album.get_top_images(count=10, author=user)
        key = ''.join(str(album.created_at) for album in top_albums).replace(' ', '')
        hash = calculate_hash_string(key)

        if not(TopAlbums.objects.filter(hash_key=hash).exists()):
            path = os.path.join(settings.MEDIA_ROOT, get_file_path(TopAlbums, f'{hash}.mp4'))
            image_quality = (1280, 1280)
            image_files = [element.image.path for element in top_albums]

            fourcc = cv2.VideoWriter_fourcc(*"mp4v")
            video = cv2.VideoWriter(
                filename=path, fourcc=fourcc, fps=0.5, frameSize=image_quality
            )

            for image in image_files:
                frame = cv2.imread(image)
                frame = cv2.resize(frame, dsize=image_quality)
                video.write(frame)
            video.release()
            top_albums = TopAlbums.objects.create(hash_key=hash, webm_file=path)
            print('new')

        else:
            top_albums = TopAlbums.objects.filter(hash_key=hash).first()
            print('exist')

        return top_albums
