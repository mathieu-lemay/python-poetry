FROM python:3.6-alpine

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.15

RUN set -eu; \
    apk add --no-cache --virtual .deps curl gcc musl-dev libffi-dev; \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py \
        | python - --version "${POETRY_VERSION}"; \
    apk del --no-cache .deps; \
    find "/root/.local/share/pypoetry" -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.local/bin:$PATH"
