# Docker Hub configuration
DOCKER_HUB_USERNAME=warhammer21
DOCKER_HUB_REPO=aws_beanstalk
IMAGE_NAME=$(DOCKER_HUB_USERNAME)/$(DOCKER_HUB_REPO):latest

# Elastic Beanstalk configuration
EB_APP_NAME=my-flask-env
EB_ENV_NAME=flask-app

# Build and push Docker image to Docker Hub
docker-build:
	docker build -t $(IMAGE_NAME) .
	docker push $(IMAGE_NAME)

# Deploy to Elastic Beanstalk
deploy: docker-build
	eb init -p docker $(EB_APP_NAME) --region us-east-2
	eb create $(EB_ENV_NAME) --service-role aws-elasticbeanstalk-ec2-role
	eb deploy $(EB_ENV_NAME)
