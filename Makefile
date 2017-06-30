help:
	@cat Makefile

NAME=dl-boilerplate
GPU?=0
DOCKER_FILE=Dockerfile
DOCKER=GPU=$(GPU) nvidia-docker
BACKEND=tensorflow
TEST=tests/
SRC=$(shell pwd)

build:
	docker build -t $(NAME) --build-arg python_version=3.5 -f $(DOCKER_FILE) .

bash: build
	$(DOCKER) run -it -v $(SRC):/src --env KERAS_BACKEND=$(BACKEND) $(NAME) bash

ipython: build
	$(DOCKER) run -it -v $(SRC):/src --env KERAS_BACKEND=$(BACKEND) $(NAME) ipython

notebook: build
	$(DOCKER) run -it -v $(SRC):/src --net=host --env KERAS_BACKEND=$(BACKEND) $(NAME)