FROM python:3.8-slim

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

RUN apt-get update \
    && savedAptMark="$(apt-mark showmanual)" \
    && apt-get install -y --no-install-recommends curl git \
    \
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
        | python - --version "${POETRY_VERSION}" \
    \
    && apt-mark auto '.*' > /dev/null \
    && [ -z "${savedAptMark}" ] || apt-mark manual ${savedAptMark} \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.poetry/bin:$PATH"
