FROM python:3.7

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ENV POETRY_VERSION 1.1.3

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
    | python - --version "${POETRY_VERSION}"

ENV PATH="/root/.poetry/bin:$PATH"
