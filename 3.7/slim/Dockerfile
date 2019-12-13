FROM python:3.7-slim

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl git && \
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.poetry/bin:$PATH"
