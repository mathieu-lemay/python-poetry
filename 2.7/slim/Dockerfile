FROM python:2.7-slim

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.15

RUN set -eu; \
    apt-get update; \
    savedAptMark="$(apt-mark showmanual)"; \
    apt-get install -y --no-install-recommends curl git; \
    \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
        | sed -E 's/(self\._get\(self\.METADATA_URL\).decode)\(\)/\1("utf-8")/' \
        | python - --version "${POETRY_VERSION}"; \
    \
    apt-mark auto '.*' > /dev/null; \
    [ -z "${savedAptMark}" ] || apt-mark manual ${savedAptMark}; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*; \
    find /root/.poetry -not -user 0 -exec chown 0:0 '{}' \;;

ENV PATH="/root/.poetry/bin:$PATH"
