#! /bin/bash

set -eu

VERSION="${1:?}"
LATEST="3.11"
POETRY_VERSION="1.2.2"

shift

build_options=("--platform" "linux/amd64,linux/arm64" "$@")

docker buildx build "${build_options[@]}" --build_arg=PY_VERSION="${VERSION}" -t "acidrain/python-poetry:${VERSION}" -f "Dockerfile" .
docker buildx build "${build_options[@]}" --build_arg=PY_VERSION="${VERSION}" -t "acidrain/python-poetry:${VERSION}-slim" -f "Dockerfile.slim" .
docker buildx build "${build_options[@]}" --build_arg=PY_VERSION="${VERSION}" -t "acidrain/python-poetry:${VERSION}-alpine" -f "Dockerfile.alpine" .

docker buildx build "${build_options[@]}" --build_arg=PY_VERSION="${VERSION}" -t "acidrain/python-poetry:${VERSION}-${POETRY_VERSION}" -f "Dockerfile" .
docker buildx build "${build_options[@]}" --build_arg=PY_VERSION="${VERSION}" -t "acidrain/python-poetry:${VERSION}-slim-${POETRY_VERSION}" -f "Dockerfile.slim" .
docker buildx build "${build_options[@]}" --build_arg=PY_VERSION="${VERSION}" -t "acidrain/python-poetry:${VERSION}-alpine-${POETRY_VERSION}" -f "Dockerfile.alpine" .

if [[ "${VERSION}" == "${LATEST}" ]]; then
    docker buildx build "${build_options[@]}" --build_arg=PY_VERSION="${VERSION}" -t "acidrain/python-poetry:latest" -f "Dockerfile" .
fi

