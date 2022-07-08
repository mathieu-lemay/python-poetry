FROM python:3.5-alpine

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.14

RUN set -eu; \
    apk add --no-cache --virtual .deps curl; \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
        | python - --version "${POETRY_VERSION}"; \
    apk del --no-cache .deps; \
    find /root/.poetry -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.poetry/bin:$PATH"
