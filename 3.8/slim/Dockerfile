FROM python:3.8-slim

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.14

RUN set -eu; \
    apt-get update; \
    savedAptMark="$(apt-mark showmanual)"; \
    apt-get install -y --no-install-recommends curl git gcc libffi-dev libc6-dev; \
    \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py \
        | python - --version "${POETRY_VERSION}"; \
    \
    apt-mark auto '.*' > /dev/null; \
    [ -z "${savedAptMark}" ] || apt-mark manual ${savedAptMark}; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*; \
    find "/root/.local/share/pypoetry" -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.local/bin:$PATH"
