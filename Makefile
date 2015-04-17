all:
	@cat .help_msg

HOSTS=$(shell tail -n +2 instances | awk --field-separator=';' '{print $$1}')

PINGS=$(foreach host, $(HOSTS), ping_test_$(host))

######################################################################

ping_test: $(PINGS)

hosts:
	@for h in $(HOSTS); do echo $$h; done

######################################################################

ping_test_%:
	@./ping_host.sh $(subst ping_test_,,$@)

help: all


.PHONY: all help hosts
