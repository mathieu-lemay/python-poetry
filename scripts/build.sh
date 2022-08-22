#! /bin/bash

set -eu

VERSION="${1:?}"
LATEST="3.10"
POETRY_VERSION="1.1.15"

shift

build_options=("--platform" "linux/amd64,linux/arm64" "$@")

docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${VERSION}" -f "${VERSION}/Dockerfile" .
docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${VERSION}-slim" -f "${VERSION}/slim/Dockerfile" .
docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${VERSION}-alpine" -f "${VERSION}/alpine/Dockerfile" .

docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${VERSION}-${POETRY_VERSION}" -f "${VERSION}/Dockerfile" .
docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${VERSION}-slim-${POETRY_VERSION}" -f "${VERSION}/slim/Dockerfile" .
docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${VERSION}-alpine-${POETRY_VERSION}" -f "${VERSION}/alpine/Dockerfile" .

if [[ "${VERSION}" == "${LATEST}" ]]; then
    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:latest" -f "${LATEST}/Dockerfile" .
fi
