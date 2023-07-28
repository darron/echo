# echo

Needed a simple way to see what HTTP headers were actually making it through all the way through various infrastructure bits to the final endpoint.

This was the quickest and simplest way to do it.

## To use:

```bash
# Set the location of your container.
export CONTAINER_NAME=yourcontainer/name

# Build the container.
make docker

# IMPORTANT: Make sure to update the domain name in ing.yml

# Deploy manually or `make run`
kubectl apply -f svc.yml
kubectl apply -f ing.yml
kubectl run echo --image=$CONTAINER_NAME:latest
```

## To verify it's running:

```bash
~ curl https://domain.name.goes.here/echo
Accept: */*
Accept-Encoding: gzip
Cdn-Loop: cloudflare
Cf-Connecting-Ip: 131.226.47.66
Cf-Ipcountry: CA
Cf-Ray: 7ee0064cff392763-SEA
Cf-Visitor: {"scheme":"https"}
Cf-Warp-Tag-Id: 225242b4-293b-4b62-bf74-e6bf389272c3
True-Client-Ip: 131.226.47.66
User-Agent: curl/7.87.0
X-Forwarded-For: 127.0.0.1
X-Forwarded-Host: domain.name.goes.here
X-Forwarded-Port: 80
X-Forwarded-Proto: http
X-Forwarded-Scheme: http
X-Original-Forwarded-For: 131.226.47.66
X-Real-Ip: 127.0.0.1
X-Request-Id: d52011400102472b4baec1395db84ba8
X-Request-Id: d52011400102472b4baec1395db84ba8
X-Scheme: http
```