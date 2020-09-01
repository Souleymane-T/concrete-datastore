# pull official base image
FROM python:3-stretch

ENV PATH="/concrete-datastore/bin:${PATH}"

RUN mkdir -p /concrete-datastore
RUN mkdir -p /app

WORKDIR /concrete-datastore
COPY . .

RUN /usr/bin/python3 -m venv /concrete-datastore/env

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install gunicorn
RUN pip install -e ".[full]"

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




