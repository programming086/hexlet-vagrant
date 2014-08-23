SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

NEW_T := $(shell cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1)
CS = $(shell docker ps -a -q)

IMAGE_ID_FILE = /var/tmp/docker_image_id
IMAGE_ID = $(shell cat $(IMAGE_ID_FILE))

CONTAINER_ID_FILE = /var/tmp/docker_container_id
CONTAINER_ID = $(shell cat $(CONTAINER_ID_FILE))

build: stop
	docker build -t $(NEW_T) . && echo $(NEW_T) > $(IMAGE_ID_FILE)

bash:
	@ docker run -it -v $(CURDIR)/:/root/exercise $(IMAGE_ID) /bin/bash

run: remove
	@ docker run -dt -v $(CURDIR)/:/root/exercise $(IMAGE_ID) > $(CONTAINER_ID_FILE) && echo "RUN"

stop:
	@ docker kill $(CS) > /dev/null 2>&1; echo "STOP"

remove: stop
	@ docker rm $(CS) > /dev/null 2>&1; echo "REMOVE"

# CHECK RUNNING
test:
	sudo /vagrant/docker-enter $(CONTAINER_ID) /bin/bash -c 'cd /root/exercise && ./run'

.PHONY: test build bash run stop
