#! /bin/bash

set -eu

PYTHON_VERSION="${1:?}"
LATEST="3.12"
POETRY_VERSION="1.7.1"

shift

variants=("" "slim" "alpine")
build_options=(
    "--build-arg"
    "PYTHON_VERSION=${PYTHON_VERSION}"
    "--build-arg"
    "POETRY_VERSION=${POETRY_VERSION}"
    "$@"
)

for variant in "${variants[@]}"; do
    tag="acidrain/python-poetry:${PYTHON_VERSION}${variant:+-${variant}}"
    dockerfile="Dockerfile${variant:+.${variant}}"

    docker build "${build_options[@]}" -t "${tag}" -f "${dockerfile}" .
    docker build "${build_options[@]}" -t "${tag}-${POETRY_VERSION}" -f "${dockerfile}" .
done

if [[ "${PYTHON_VERSION}" == "${LATEST}" ]]; then
    docker build "${build_options[@]}" -t "acidrain/python-poetry:latest" -f "Dockerfile" .
fi
