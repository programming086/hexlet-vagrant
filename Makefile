build:
	vagrant up
	vagrant provision

clean:
	vagrant halt
	vagrant destroy

rebuild: clean build

run:
	vagrant ssh

upgrade:
	git pull
	vagrant provision

dev_run:
	vagrant ssh -- -R 3000:localhost:3000

.PHONY: build run upgrade
