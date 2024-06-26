# Generated by Django 5.0.4 on 2024-05-06 20:38

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('configuracion', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Ubicacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('direccion', models.CharField(max_length=1000, verbose_name='Dirección')),
                ('referencia', models.CharField(max_length=500, verbose_name='Referencia')),
                ('codigo_postal', models.CharField(max_length=20, verbose_name='Código postal')),
                ('latitud', models.DecimalField(decimal_places=8, max_digits=12, verbose_name='Latitud')),
                ('longitud', models.DecimalField(decimal_places=8, max_digits=12, verbose_name='Longitud')),
                ('ciudad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='configuracion.ciudad', verbose_name='Ciudad')),
            ],
            options={
                'verbose_name': 'Ubicacion',
                'verbose_name_plural': 'Ubicaciones',
                'db_table': 'Ubicacion',
            },
        ),
        migrations.CreateModel(
            name='Entrega',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fechahora_entrega', models.DateTimeField(auto_now_add=True, verbose_name='Fecha y hora de entrega')),
                ('detalles_entrega', models.CharField(blank=True, max_length=1000, null=True, verbose_name='Anotaciones del encargado de la entrega')),
                ('empleado', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Empleado asignado')),
                ('estado_entrega', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='configuracion.estadoentrega', verbose_name='Estado de la entrega')),
                ('ubicacion', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='reparto.ubicacion', verbose_name='Orden')),
            ],
            options={
                'verbose_name': 'Entrega',
                'verbose_name_plural': 'Entregas',
                'db_table': 'Entrega',
            },
        ),
    ]
