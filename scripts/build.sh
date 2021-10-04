#! /bin/bash

set -eu

VERSIONS=("2.7" "3.5" "3.6" "3.7" "3.8" "3.9")
LATEST="3.9"
POETRY_VERSION="1.1.11"

error() { printf "\\e[35m[ERROR]\\e[0m %s\\n" "$*" >&2 ; exit 1 ; }

[ $# -ne 1 ] && error "Usage: $0 (build|push|update|clean)"

build() {
    for version in "${VERSIONS[@]}"; do
        docker build -t "acidrain/python-poetry:${version}" -f "${version}/Dockerfile" .
        docker build -t "acidrain/python-poetry:${version}-slim" -f "${version}/slim/Dockerfile" .
        docker build -t "acidrain/python-poetry:${version}-alpine" -f "${version}/alpine/Dockerfile" .

        docker tag "acidrain/python-poetry:${version}" "acidrain/python-poetry:${version}-${POETRY_VERSION}"
        docker tag "acidrain/python-poetry:${version}-slim" "acidrain/python-poetry:${version}-slim-${POETRY_VERSION}"
        docker tag "acidrain/python-poetry:${version}-alpine" "acidrain/python-poetry:${version}-alpine-${POETRY_VERSION}"
    done

    docker tag "acidrain/python-poetry:${LATEST}" "acidrain/python-poetry:latest"
}

push() {
    for version in "${VERSIONS[@]}"; do
        docker push "acidrain/python-poetry:${version}"
        docker push "acidrain/python-poetry:${version}-${POETRY_VERSION}"
        docker push "acidrain/python-poetry:${version}-slim"
        docker push "acidrain/python-poetry:${version}-slim-${POETRY_VERSION}"
        docker push "acidrain/python-poetry:${version}-alpine"
        docker push "acidrain/python-poetry:${version}-alpine-${POETRY_VERSION}"
    done

    docker push "acidrain/python-poetry:latest"
}

update() {
    [[ -z "${POETRY_VERSION:-}" ]] && error "POETRY_VERSION not set"

    for version in "${VERSIONS[@]}"; do
        [ -d "${version}/slim" ] || mkdir -p "${version}/slim"
        [ -d "${version}/alpine" ] || mkdir -p "${version}/alpine"

        cp Dockerfile.template "${version}/Dockerfile"
        cp Dockerfile.slim.template "${version}/slim/Dockerfile"
        cp Dockerfile.alpine.template "${version}/alpine/Dockerfile"

        find "${version}" -name Dockerfile -print0 | xargs -0 sed -i "s/__PYTHON_VERSION__/${version}/"
    done

    find -name Dockerfile -print0 | xargs -0 sed -i "s/__POETRY_VERSION__/${POETRY_VERSION}/"
}

clean() {
    set +e
    docker rmi "acidrain/python-poetry"

    for version in "${VERSIONS[@]}"; do
        docker rmi "acidrain/python-poetry:${version}"
        docker rmi "acidrain/python-poetry:${version}-${POETRY_VERSION}"
        docker rmi "acidrain/python-poetry:${version}-slim"
        docker rmi "acidrain/python-poetry:${version}-slim-${POETRY_VERSION}"
        docker rmi "acidrain/python-poetry:${version}-alpine"
        docker rmi "acidrain/python-poetry:${version}-alpine-${POETRY_VERSION}"
        docker rmi "python:${version}"
        docker rmi "python:${version}-slim"
        docker rmi "python:${version}-alpine"
    done
    set -e
}

cmd="$1"
case "$cmd" in
    build)
        build;;
    push)
        push;;
    update)
        update;;
    clean)
        clean;;
    *)
        error "Invalid command: ${cmd}";;
esac
