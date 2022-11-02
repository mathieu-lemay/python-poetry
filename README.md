# python-poetry

## About

The repository provides Python Docker images with `poetry` preinstalled. My motivation for this was to cut the time spend in CI installing `poetry`, but this will be useful for local development, too.

[Docker Hub](https://hub.docker.com/r/acidrain/python-poetry/)

## Supported tags

* [3.7](https://github.com/mathieu-lemay/python-poetry/blob/master/3.7/Dockerfile)
* [3.8](https://github.com/mathieu-lemay/python-poetry/blob/master/3.8/Dockerfile)
* [3.9](https://github.com/mathieu-lemay/python-poetry/blob/master/3.9/Dockerfile)
* [3.10, latest](https://github.com/mathieu-lemay/python-poetry/blob/master/3.10/Dockerfile)

## Unsupported versions
For python 2.7, 3.5 or 3.6, you can still use poetry 1.1.15 with the following tags:
`acidrain/python-poetry:{version}{,-slim,-alpine}-1.1.15`

## Thanks

Many thanks to [Etienne Napoleone](https://github.com/etienne-napoleone) who originally created this repository
and to [Jon Atkinson](https://github.com/jonatkinson) who maintained it.

