# Generated by Django 3.2.20 on 2023-08-23 11:25

from django.db import migrations, models
import django.utils.timezone
import garpix_utils.file.file_field


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_alter_album_thumbnail'),
    ]

    operations = [
        migrations.CreateModel(
            name='TopAlbums',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now, editable=False, verbose_name='Создано')),
                ('hash_key', models.CharField(max_length=64, unique=True, verbose_name='Хэш ключ')),
                ('webm_file', models.FileField(upload_to=garpix_utils.file.file_field.get_file_path, verbose_name='Подборка топ-10 просматриваемых фото')),
            ],
            options={
                'verbose_name': 'Топ фотографий',
                'verbose_name_plural': 'Топ фотографий',
                'ordering': ['-created_at'],
            },
        ),
    ]
