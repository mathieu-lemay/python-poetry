FROM python:3.8

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.2.2

RUN set -eu; \
    curl -sSL https://install.python-poetry.org \
        | python - --version "${POETRY_VERSION}"; \
    find "/root/.local/share/pypoetry" -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.local/bin:$PATH"
