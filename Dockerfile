ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

ARG POETRY_VERSION
ENV POETRY_VERSION ${POETRY_VERSION}

RUN set -eu; \
    curl -sSL https://install.python-poetry.org \
        | python - --version "${POETRY_VERSION}";

ENV PATH="/root/.local/bin:$PATH"
