FROM python:2.7-alpine

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.7

RUN apk add --no-cache --virtual .deps curl \
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
        | python - --version "${POETRY_VERSION}" \
    && apk del --no-cache .deps

ENV PATH="/root/.poetry/bin:$PATH"
