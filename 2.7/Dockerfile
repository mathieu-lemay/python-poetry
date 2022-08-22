FROM python:2.7

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.15

RUN set -eu; \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
        | sed -E 's/(self\._get\(self\.METADATA_URL\).decode)\(\)/\1("utf-8")/' \
        | python - --version "${POETRY_VERSION}"; \
    find /root/.poetry -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.poetry/bin:$PATH"
