ID := $(shell basename $(CURDIR))
CONTAINER_ID := $(addsuffix _container, $(ID))
IMAGE_ID := $(addsuffix _image, $(ID))
CS = $(shell docker ps -a -q)

EXEC_TESTS = /bin/bash -c 'cd /root/exercise && $(RUN_TESTS)'

build: stop
	docker build -t $(IMAGE_ID) .

bash:
	@ docker run -it -v $(CURDIR)/:/root/exercise $(IMAGE_ID) /bin/bash

start: stop
ifeq ([], $(shell docker inspect $(IMAGE_ID) 2> /dev/null))
	@ echo "Please, run 'make build' before 'make start'";
else
	@ docker run -p 8080:8080 -dt -v $(CURDIR)/:/root/exercise --name $(CONTAINER_ID) $(IMAGE_ID) > /dev/null 2>&1
endif

# stop:
# 	@ docker stop $(CS) > /dev/null 2>&1; echo ""

stop:
	@ docker rm -f $(CS) > /dev/null 2>&1; echo ""

test:
ifeq ([], $(shell docker inspect $(CONTAINER_ID) 2> /dev/null))
	@ echo "Please, run 'make start' before 'make test'";
else
	@ sudo /vagrant/bin/docker-enter $(CONTAINER_ID) $(EXEC_TESTS)
endif

.PHONY: test build bash run stop
