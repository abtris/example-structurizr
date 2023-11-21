# https://suva.sh/posts/well-documented-makefiles/#simple-makefile
.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: help deps clean build watch

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

deps:  ## Check dependencies
	@docker pull structurizr/lite

watch: ## Watch file changes and build
	@docker run -it --rm -p 8080:8080 -v .:/usr/local/structurizr structurizr/lite
