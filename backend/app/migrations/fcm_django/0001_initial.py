# Generated by Django 3.2.20 on 2023-08-10 11:18

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='FCMDevice',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=255, null=True, verbose_name='Name')),
                ('active', models.BooleanField(default=True, help_text='Inactive devices will not be sent notifications', verbose_name='Is active')),
                ('date_created', models.DateTimeField(auto_now_add=True, null=True, verbose_name='Creation date')),
                ('device_id', models.CharField(blank=True, db_index=True, help_text='Unique device identifier', max_length=150, null=True, verbose_name='Device ID')),
                ('registration_id', models.TextField(verbose_name='Registration token')),
                ('type', models.CharField(choices=[('ios', 'ios'), ('android', 'android'), ('web', 'web')], max_length=10)),
            ],
            options={
                'verbose_name': 'FCM device',
                'verbose_name_plural': 'FCM devices',
            },
        ),
    ]
