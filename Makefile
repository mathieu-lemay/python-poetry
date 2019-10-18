all:
	cd 2.7 && docker build -t python-poetry-preview . && docker tag python-poetry-preview acidrain/python-poetry-preview:2.7
	cd 3.4 && docker build -t python-poetry-preview . && docker tag python-poetry-preview acidrain/python-poetry-preview:3.4
	cd 3.5 && docker build -t python-poetry-preview . && docker tag python-poetry-preview acidrain/python-poetry-preview:3.5
	cd 3.6 && docker build -t python-poetry-preview . && docker tag python-poetry-preview acidrain/python-poetry-preview:3.6
	cd 3.7 && docker build -t python-poetry-preview . && docker tag python-poetry-preview acidrain/python-poetry-preview:3.7
	cd 3.8 && docker build -t python-poetry-preview . && docker tag python-poetry-preview acidrain/python-poetry-preview:3.8
	docker tag acidrain/python-poetry-preview:3.8 acidrain/python-poetry-preview:latest

push:
	docker push acidrain/python-poetry-preview:2.7
	docker push acidrain/python-poetry-preview:3.4
	docker push acidrain/python-poetry-preview:3.5
	docker push acidrain/python-poetry-preview:3.6
	docker push acidrain/python-poetry-preview:3.7
	docker push acidrain/python-poetry-preview:3.8
	docker push acidrain/python-poetry-preview:latest

