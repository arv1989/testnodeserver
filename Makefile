#
# Makefile for this application
#

# PROJECT=$(shell gcloud config list project | awk 'FNR ==2 { print $$3 }')
TAG_VERSION=default
#TAG=gcr.io/$(PROJECT)/sukie:$(TAG_VERSION)
TAG=arv1989/simplenodeserver:$(TAG_VERSION)
NAME=simplenodeserver

# build the docker image|
build: deps
	docker build --tag=$(TAG) .

clean:
	docker rmi $(TAG)

# push the docker image up to the Google Container repository
push:
	docker push $(TAG)

# install all the node dependencies
deps:
	npm install

# run the nodejs application
serve:
	npm start

serve-docker:
	docker run --rm -p=8080 --name=$(NAME) $(TAG)

stop-docker:
	docker stop $(NAME)

