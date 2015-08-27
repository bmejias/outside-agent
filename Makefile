all:
	@cat .help_msg

HOSTS=$(shell tail -n +2 instances | awk --field-separator=';' '{print $$1}')

PINGS=$(foreach host, $(HOSTS), ping_test_$(host))
VERSIONS=$(foreach host, $(HOSTS), get_version_$(host))
LICS=$(foreach host, $(HOSTS), check_license_$(host))
SSHS=$(foreach host, $(HOSTS), ssh_test_$(host))
LOGINS=$(foreach host, $(HOSTS), login_test_$(host))
STARTS=$(foreach host, $(HOSTS), start_$(host))
STATUS=$(foreach host, $(HOSTS), status_$(host))
STOPS=$(foreach host, $(HOSTS), stop_$(host))

######################################################################

license: $(LICS)

login: $(LOGINS)

ping: $(PINGS)

ssh: $(SSHS)

start: $(STARTS)

status: $(STATUS)

stop: $(STOPS)

version: $(VERSIONS)

hosts:
	@for h in $(HOSTS); do echo $$h; done

######################################################################

check_license_%:
	@./check_license.sh $(subst check_license_,,$@)

login_test_%:
	@./login_test.sh $(subst login_test_,,$@)

get_version_%:
	@./get_version.sh $(subst get_version_,,$@)

ping_test_%:
	@./ping_host.sh $(subst ping_test_,,$@)

start_%:
	@./service.sh $(subst start_,,$@) start

status_%:
	@./service.sh $(subst status_,,$@) status

stop_%:
	@./service.sh $(subst stop_,,$@) stop

ssh_test_%:
	@./ssh_test.sh $(subst ssh_test_,,$@)

help: all


.PHONY: all help hosts ping_test version license login ping ssh_test \
	start status stop
