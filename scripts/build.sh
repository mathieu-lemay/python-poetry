#! /bin/bash -eu

[ $# -ne 1 ] && error "Usage: $0 (build|push|update|clean)"

VERSIONS=("2.7" "3.5" "3.6" "3.7" "3.8" "3.9")
LATEST="3.9"

error() { printf "\\e[35m[ERROR]\\e[0m %s\\n" "$*" >&2 ; exit 1 ; }

build() {
    for version in "${VERSIONS[@]}"; do
        docker build -t "acidrain/python-poetry:${version}" -f "${version}/Dockerfile" .
        docker build -t "acidrain/python-poetry:${version}-slim" -f "${version}/slim/Dockerfile" .
        docker build -t "acidrain/python-poetry:${version}-alpine" -f "${version}/alpine/Dockerfile" .
    done

    docker tag "acidrain/python-poetry:${LATEST}" "acidrain/python-poetry:latest"
}

push() {
    for version in "${VERSIONS[@]}"; do
        docker push "acidrain/python-poetry:${version}"
        docker push "acidrain/python-poetry:${version}-slim"
        docker push "acidrain/python-poetry:${version}-alpine"
    done

    docker push "acidrain/python-poetry:latest"
}

update() {
    for version in "${VERSIONS[@]}"; do
        [ -d "${version}/slim" ] || mkdir -p "${version}/slim"
        [ -d "${version}/alpine" ] || mkdir -p "${version}/alpine"

        cp Dockerfile.template "${version}/Dockerfile"
        sed -i "s/__VERSION__/${version}/" "${version}/Dockerfile"

        cp Dockerfile.slim.template "${version}/slim/Dockerfile"
        sed -i "s/__VERSION__/${version}/" "${version}/slim/Dockerfile"

        cp Dockerfile.alpine.template "${version}/alpine/Dockerfile"
        sed -i "s/__VERSION__/${version}/" "${version}/alpine/Dockerfile"
    done
}

clean() {
    set +e
    docker rmi "acidrain/python-poetry"

    for version in "${VERSIONS[@]}"; do
        docker rmi "acidrain/python-poetry:${version}"
        docker rmi "acidrain/python-poetry:${version}-slim"
        docker rmi "acidrain/python-poetry:${version}-alpine"
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
