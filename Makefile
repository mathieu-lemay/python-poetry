all:
	cd 2.7 && docker build -t python-poetry . && docker tag python-poetry jonatkinson/python-poetry:2.7
	cd 3.4 && docker build -t python-poetry . && docker tag python-poetry jonatkinson/python-poetry:3.4
	cd 3.5 && docker build -t python-poetry . && docker tag python-poetry jonatkinson/python-poetry:3.5
	cd 3.6 && docker build -t python-poetry . && docker tag python-poetry jonatkinson/python-poetry:3.6
	cd 3.7 && docker build -t python-poetry . && docker tag python-poetry jonatkinson/python-poetry:3.7

push:
	cd 2.7 && docker push jonatkinson/python-poetry:2.7
	cd 3.4 && docker push jonatkinson/python-poetry:3.4
	cd 3.5 && docker push jonatkinson/python-poetry:3.5
	cd 3.6 && docker push jonatkinson/python-poetry:3.6
	cd 3.7 && docker push jonatkinson/python-poetry:3.7

