# Generated by Django 3.2.20 on 2023-08-14 08:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('garpix_notify', '0003_auto_20230811_1309'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notify',
            name='event',
            field=models.IntegerField(blank=True, choices=[(1, 'Example')], null=True, verbose_name='Событие'),
        ),
        migrations.AlterField(
            model_name='notifytemplate',
            name='event',
            field=models.IntegerField(blank=True, choices=[(1, 'Example')], null=True, verbose_name='Событие'),
        ),
        migrations.AlterField(
            model_name='systemnotify',
            name='event',
            field=models.IntegerField(blank=True, choices=[(1, 'Example')], null=True, verbose_name='Событие'),
        ),
    ]
