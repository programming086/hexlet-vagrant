build:
	git pull
	vagrant up
	vagrant provision

clean: halt
	vagrant destroy -f

rebuild: clean build

run:
	vagrant up
	vagrant ssh

halt:
	vagrant halt

dev_run:
	vagrant ssh -- -R 3000:localhost:3000

.PHONY: build run rebuild pull
