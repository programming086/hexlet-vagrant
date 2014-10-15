ID := $(shell basename $(CURDIR))
CONTAINER_ID := $(addsuffix _container, $(ID))
IMAGE_ID := $(addsuffix _image, $(ID))
CS = $(shell docker ps -a -q)

build: stop
	docker build -t $(IMAGE_ID) .

bash:
	@ docker run -it  $(IMAGE_ID) /bin/bash -l

attach:
	sudo /vagrant/bin/docker-enter $(CONTAINER_ID) /bin/bash -l

start: stop
ifeq ([], $(shell docker inspect $(IMAGE_ID) 2> /dev/null))
	@ echo "Please, run 'make build' before 'make start'" >&2; exit 1;
else
	@ docker run -d -p 8000:8000 -t -v $(CURDIR)/exercise/:/usr/src/app --name $(CONTAINER_ID) $(IMAGE_ID)
endif

# stop:
# 	@ docker stop $(CS) > /dev/null 2>&1; echo ""

stop:
	docker rm -f $(CS) > /dev/null 2>&1; echo ""

test:
ifeq ([], $(shell docker inspect $(CONTAINER_ID) 2> /dev/null))
	@ echo "Please, run 'make start' before 'make test'" >&2; exit 1;
else
	@ sudo /vagrant/bin/docker-enter $(CONTAINER_ID) /bin/bash -l -c 'cd /usr/src/app && make test'
endif

.PHONY: test build bash run stop
