all: docker

docker:
	docker buildx build . --platform linux/amd64,linux/arm64 -t darron/echo:latest --push

run:
	kubectl run echo --image=darron/echo:latest

.PHONY: docker run