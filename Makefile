CONTAINER_NAME ?= darron/echo

all: docker

docker:
	docker buildx build . --platform linux/amd64,linux/arm64 -t $(CONTAINER_NAME):latest --push

run:
	kubectl apply -f svc.yml
	kubectl apply -f ing.yml
	kubectl run echo --image=$(CONTAINER_NAME):latest

.PHONY: docker run