NEW_T := $(shell cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1)
CS = "$(shell docker ps -a -q)"

build:
	export IMAGE_ID=$(NEW_T) && docker build -t $(NEW_T) .

bash:
	@ docker run -it $(shell cat tmp/imid) /bin/bash

run: stop
	@ docker run -p 8080:8080 -dt -v $(CURDIR)/:/root/exercise $(IMAGE_ID)

stop:
	@ docker kill $(CS)

remove: stop
	docker rm $(CS)

# CHECK RUNNING
test:
	@ sudo docker-enter $(shell cat tmp/cid) /bin/bash -c 'cd /root/exercise && ./run'

.PHONY: test build bash run stop t mkdir
