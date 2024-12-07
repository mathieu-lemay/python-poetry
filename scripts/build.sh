#! /bin/bash

set -eu

PYTHON_VERSION="${1:?}"
LATEST="3.13"
POETRY_VERSION="1.8.5"

shift

variants=("" "slim" "alpine")
build_options=(
    "--platform"
    "linux/amd64,linux/arm64"
    "--build-arg"
    "PYTHON_VERSION=${PYTHON_VERSION}"
    "--build-arg"
    "POETRY_VERSION=${POETRY_VERSION}"
    "$@"
)

for variant in "${variants[@]}"; do
    tag="acidrain/python-poetry:${PYTHON_VERSION}${variant:+-${variant}}"
    dockerfile="Dockerfile${variant:+.${variant}}"

    docker buildx build "${build_options[@]}" -t "${tag}" -f "${dockerfile}" .
    docker buildx build "${build_options[@]}" -t "${tag}-${POETRY_VERSION}" -f "${dockerfile}" .
done

if [[ "${PYTHON_VERSION}" == "${LATEST}" ]]; then
    docker buildx build "${build_options[@]}" -t "acidrain/python-poetry:latest" -f "Dockerfile" .
fi
