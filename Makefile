.PHONY: init deploy

init:
	poetry install

deploy:
	eb init -p python-3.9 flaskiso --region us-west-1
	eb create flaskiso-env
	eb deploy