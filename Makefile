DOCKER := $(shell { command -v podman || command -v docker; })

.PHONY: all clean

all: clean
	$(DOCKER) build --tag teams-for-linux-custom-bg .
	$(DOCKER) run -d --restart unless-stopped --name teams-for-linux-custom-bg \
		-v $(PWD)/backgrounds:/images \
		-p 8080:80 -p 8081:443 \
		teams-for-linux-custom-bg

clean:
	-$(DOCKER) container rm -f teams-for-linux-custom-bg
	-$(DOCKER) image rm teams-for-linux-custom-bg
