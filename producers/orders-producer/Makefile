.Phony: build test run

current_commit_hash := $(shell git rev-parse HEAD)
docker_name := gigatexal/end-2-end-data-eng-order-producer
docker_name_and_tag := $(docker_name):$(current_commit_hash)

test:
	@echo "run tests"

build: test
	sudo docker build . -t $(docker_name_and_tag) 

run: build
	docker run -d $(docker_name_and_tag)
