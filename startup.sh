touch /concrete-datastore/concrete_datastore/concrete/migrations/__init__.py
concrete-datastore makemigrations
concrete-datastore migrate
concrete-datastore create_superuser --password test test@netsach.com
concrete-datastore collectstatic --noinput
