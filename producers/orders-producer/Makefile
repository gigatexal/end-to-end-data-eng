.Phony: build test run

current_commit_hash := $(shell git rev-parse HEAD)
docker_name := gigatexal/end-2-end-data-eng-order-producer
docker_name_and_tag := $(docker_name):$(current_commit_hash)

container_runtime := docker

lint:
	@black src
	@isort src

test:
	@echo "run tests"

build: test
	sudo $(container_runtime) build . -t $(docker_name_and_tag) 

run: build
	$(container_runtime) run -d $(docker_name_and_tag)
