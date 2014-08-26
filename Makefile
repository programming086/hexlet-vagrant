build:
	vagrant up
	vagrant provision

run:
	vagrant ssh

upgrade:
	git pull
	vagrant provision

dev_run:
	vagrant ssh -- -R 3000:localhost:3000

.PHONY: build run upgrade
