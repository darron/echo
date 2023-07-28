all: docker

docker:
	docker buildx build . --platform linux/amd64,linux/arm64 -t darron/echo:latest --push

# Make sure to update the domain name in ing.yml
run:
	kubectl apply -f svc.yml
	kubectl apply -f ing.yml
	kubectl run echo --image=darron/echo:latest

.PHONY: docker run