FROM python:3.8

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.2

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
    | python - --version "${POETRY_VERSION}"

ENV PATH="/root/.poetry/bin:$PATH"
