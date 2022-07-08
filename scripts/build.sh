#! /bin/bash

set -eu

VERSIONS=("2.7" "3.5" "3.6" "3.7" "3.8" "3.9" "3.10")
LATEST="3.10"
POETRY_VERSION="1.1.14"

build_options=("--platform" "linux/amd64,linux/arm64" "$@")

for version in "${VERSIONS[@]}"; do
    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${version}" -f "${version}/Dockerfile" .
    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${version}-slim" -f "${version}/slim/Dockerfile" .
    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${version}-alpine" -f "${version}/alpine/Dockerfile" .

    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${version}-${POETRY_VERSION}" -f "${version}/Dockerfile" .
    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${version}-slim-${POETRY_VERSION}" -f "${version}/slim/Dockerfile" .
    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:${version}-alpine-${POETRY_VERSION}" -f "${version}/alpine/Dockerfile" .
done

docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:latest" -f "${LATEST}/Dockerfile" .
