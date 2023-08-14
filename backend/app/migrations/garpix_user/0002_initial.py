# Generated by Django 3.2.20 on 2023-08-10 11:18

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('garpix_user', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AddField(
            model_name='usersession',
            name='user',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Пользователь'),
        ),
        migrations.AddField(
            model_name='refreshtoken',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='refresh_tokens', to=settings.AUTH_USER_MODEL, verbose_name='User'),
        ),
        migrations.AddField(
            model_name='referraluserlink',
            name='referral_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='garpix_user.referraltype', verbose_name='Откуда пришел пользователь'),
        ),
        migrations.AddField(
            model_name='referraluserlink',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='garpix_user.usersession', verbose_name='Пользователь'),
        ),
        migrations.AddField(
            model_name='accesstoken',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='access_tokens', to=settings.AUTH_USER_MODEL, verbose_name='User'),
        ),
        migrations.AlterUniqueTogether(
            name='referraluserlink',
            unique_together={('user', 'referral_type')},
        ),
    ]
