all:
	@cat .help_msg

HOSTS=$(shell tail -n +2 instances | awk --field-separator=';' '{print $$1}')

######################################################################

hosts:
	@for h in $(HOSTS); do echo $$h; done

help: all


.PHONY: all help hosts
