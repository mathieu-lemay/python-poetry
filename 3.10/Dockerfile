FROM python:3.10

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.11

RUN set -eu; \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py \
        | python - --version "${POETRY_VERSION}"; \
    find "/root/.local/share/pypoetry" -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.local/bin:$PATH"
