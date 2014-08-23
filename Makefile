build:
	vagrant up
	vagrant provision

run:
	vagrant ssh

upgrade:
	git pull
	vagrant provision

.PHONY: test
