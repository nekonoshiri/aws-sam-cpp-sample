SHELL := /bin/sh

.PHONY: help
help:
	@echo "help\tこのヘルプを表示します。"

ifdef ARTIFACTS_DIR

# `sam build` で SampleFunction をビルドする際に用いられるターゲット
.PHONY: build-SampleFunction
build-SampleFunction:
	docker compose run --rm aws-sam-cpp-sample-build
	cp build/aws-sam-cpp-sample $(ARTIFACTS_DIR)/bootstrap

endif
