FROM python:3.6

LABEL maintainer "Mathieu Lemay <acidrain1@gmail.com>"

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py -o get-poetry.py && \
    python get-poetry.py --preview && \
    rm get-poetry.py

ENV PATH="/root/.poetry/bin:$PATH"
