#! /bin/bash -eu

[ $# -ne 1 ] && error "Usage: $0 (build|push|update|clean)"

VERSIONS=("2.7" "3.4" "3.5" "3.6" "3.7" "3.8")
LATEST="3.8"

error() { printf "\\e[35m[ERROR]\\e[0m %s\\n" "$*" >&2 ; exit 1 ; }

build() {
    for version in "${VERSIONS[@]}"; do
        docker build -t "acidrain/python-poetry-preview:${version}" -f "${version}/Dockerfile" .
    done

    docker tag "acidrain/python-poetry-preview:${LATEST}" "acidrain/python-poetry-preview:latest"
}

push() {
    for version in "${VERSIONS[@]}"; do
        docker push "acidrain/python-poetry-preview:${version}"
    done

    docker push "acidrain/python-poetry-preview:latest"
}

update() {
    for version in "${VERSIONS[@]}"; do
        [ -d "${version}" ] || mkdir "${version}"
        cp Dockerfile.template "${version}/Dockerfile"
        sed -i "s/__VERSION__/${version}/" "${version}/Dockerfile"
    done
}

clean() {
    set +e
    for version in "${VERSIONS[@]}"; do
        docker rmi "acidrain/python-poetry-preview:${version}"
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
