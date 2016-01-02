#
# Makefile for this application
#

# PROJECT=$(shell gcloud config list project | awk 'FNR ==2 { print $$3 }')
V=default
#TAG=gcr.io/$(PROJECT)/sukie:$(V)
TAG=arv1989/simplenodeserver:$(V)
LATEST_TAG=arv1989/simplenodeserver:latest

NAME=simplenodeserver

# build the docker image|
build: deps
	docker build --tag=$(TAG) .
	docker build --tag=$(LATEST_TAG) .

clean:
	docker rmi $(TAG)

# push the docker image up to the Google Container repository
push:
	docker push $(TAG)
	docker push $(LATEST_TAG)

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

