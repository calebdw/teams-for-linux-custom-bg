DOCKER := $(shell { command -v podman || command -v docker; })

.PHONY: all clean

all: clean
	$(DOCKER) build --tag teams-for-linux-custom-bg .
	$(DOCKER) run -d --name teams-for-linux-custom-bg \
		-v $(PWD)/backgrounds:/teams-backgrounds \
		-p 8080:80 \
		teams-for-linux-custom-bg

clean:
	-$(DOCKER) container rm -f teams-for-linux-custom-bg
	-$(DOCKER) image rm teams-for-linux-custom-bg
