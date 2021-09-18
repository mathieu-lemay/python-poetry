FROM python:3.8

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.9

RUN set -eu; \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
        | python - --version "${POETRY_VERSION}"; \
    find /root/.poetry -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.poetry/bin:$PATH"
