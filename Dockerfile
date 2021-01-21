# pull official base image
FROM python:3.6-stretch

RUN mkdir -p /concrete-datastore
RUN mkdir -p /app

WORKDIR /concrete-datastore
COPY . .

RUN python3.6 -m venv /concrete-datastore/env

RUN /concrete-datastore/env/bin/pip install --upgrade pip
RUN /concrete-datastore/env/bin/pip install --upgrade setuptools
RUN /concrete-datastore/env/bin/pip install gunicorn
RUN /concrete-datastore/env/bin/pip install -e ".[full]"

ENV PATH="/concrete-datastore/env/bin:${PATH}"
VOLUME  ["/concrete-datastore/concrete_datastore/concrete/migrations", "/concrete-datastore/development/static"]

ENV GUNICORN_TIMEOUT=300
ENV GUNICORN_GRACEFUL_TIMEOUT=30
ENV GUNICORN_LOG_LEVEL=info
ENV DJANGO_SETTINGS_MODULE=development.settings


CMD gunicorn \
    --timeout $GUNICORN_TIMEOUT \
    --graceful-timeout $GUNICORN_GRACEFUL_TIMEOUT \
    --bind=0.0.0.0:5000 \
    --workers=1 \
    --log-level $GUNICORN_LOG_LEVEL \
    development.wsgi




