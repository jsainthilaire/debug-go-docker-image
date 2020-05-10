FROM golang:1.14-alpine

RUN apk add --no-cache ca-certificates git gcc musl-dev dpkg

RUN go get github.com/go-delve/delve/cmd/dlv

RUN mkdir app
WORKDIR app

ENV DEBUG_ADDR :2345

ENTRYPOINT dlv debug --headless --api-version=2 --listen=$DEBUG_ADDR
