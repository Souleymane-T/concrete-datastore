# Generated by Django 2.2.15 on 2021-03-04 16:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('concrete', '0008_project_gps_address'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='category',
            options={'ordering': ('-modification_date', '-creation_date'), 'verbose_name': 'Category', 'verbose_name_plural': 'Categorys'},
        ),
        migrations.AlterModelOptions(
            name='crud',
            options={'ordering': ('-modification_date', '-creation_date'), 'verbose_name': 'Crud', 'verbose_name_plural': 'Cruds'},
        ),
        migrations.AlterModelOptions(
            name='fusee',
            options={'ordering': ('-modification_date', '-creation_date'), 'verbose_name': 'Fusee', 'verbose_name_plural': 'Fusees'},
        ),
        migrations.AlterModelOptions(
            name='jsonfield',
            options={'ordering': ('-modification_date', '-creation_date'), 'verbose_name': 'JsonField', 'verbose_name_plural': 'JsonFields'},
        ),
        migrations.AlterModelOptions(
            name='village',
            options={'ordering': ('-modification_date', '-creation_date'), 'verbose_name': 'Village', 'verbose_name_plural': 'Villages'},
        ),
        migrations.AlterField(
            model_name='project',
            name='archived',
            field=models.BooleanField(blank=True, default=False, null=True),
        ),
        migrations.AlterField(
            model_name='project',
            name='ip_address',
            field=models.GenericIPAddressField(blank=True, null=True, protocol='IPv4'),
        ),
    ]
