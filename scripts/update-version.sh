#! /bin/bash

set -eu

VERSIONS=("3.7" "3.8" "3.9" "3.10")
error() { printf "\\e[35m[ERROR]\\e[0m %s\\n" "$*" >&2 ; exit 1 ; }

poetry_version="${1:?poetry version not specified}"

for version in "${VERSIONS[@]}"; do
    [ -d "${version}/slim" ] || mkdir -p "${version}/slim"
    [ -d "${version}/alpine" ] || mkdir -p "${version}/alpine"

    cp Dockerfile.template "${version}/Dockerfile"
    cp Dockerfile.slim.template "${version}/slim/Dockerfile"
    cp Dockerfile.alpine.template "${version}/alpine/Dockerfile"

    find "${version}" -name Dockerfile -print0 | xargs -0 sed -i "s/__PYTHON_VERSION__/${version}/"
done

find -name Dockerfile -print0 | xargs -0 sed -i "s/__POETRY_VERSION__/${poetry_version}/"
sed -i 's/POETRY_VERSION=.*/POETRY_VERSION="'"${poetry_version}"'"/' ./scripts/build.sh
