.PHONY: BUILD INSTALL LIST RUN

list: ## list commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

build: ## build container
	podman build \
		--build-arg USERNAME=$$(whoami) \
		--build-arg USER_UID=$$(id -u) \
		--build-arg USER_GID=$$(id -g) \
		-t agent-container .


run: ## run container
	./run.sh

install: ## install symlinks
	./scripts/install.sh
