# python-poetry

## About

The repository provides Python Docker images with `poetry` preinstalled. My motivation for this was to cut the time spend in CI installing `poetry`, but this will be useful for local development, too.

[Docker Hub](https://hub.docker.com/r/acidrain/python-poetry/)

## Supported tags

* [3.10](https://github.com/mathieu-lemay/python-poetry/blob/master/Dockerfile)
* [3.11](https://github.com/mathieu-lemay/python-poetry/blob/master/Dockerfile)
* [3.12](https://github.com/mathieu-lemay/python-poetry/blob/master/Dockerfile)
* [3.13](https://github.com/mathieu-lemay/python-poetry/blob/master/Dockerfile)
* [3.14, latest](https://github.com/mathieu-lemay/python-poetry/blob/master/Dockerfile)

## Unsupported versions
For python 2.7, 3.5 or 3.6, you can still use poetry 1.1.15 with the following tags:
`acidrain/python-poetry:{version}{,-slim,-alpine}-1.1.15`

For python 3.7, you can still use poetry 1.5.1 with the following tags:
`acidrain/python-poetry:3.7{,-slim,-alpine}-1.5.1`

For python 3.8, you can still use poetry 1.8.3 with the following tags:
`acidrain/python-poetry:3.8{,-slim,-alpine}-1.8.3`

For python 3.9, you can still use poetry 2.2.1 with the following tags:
`acidrain/python-poetry:3.9{,-slim,-alpine}-2.2.1`

## Thanks

Many thanks to [Etienne Napoleone](https://github.com/etienne-napoleone) who originally created this repository
and to [Jon Atkinson](https://github.com/jonatkinson) who maintained it.
