ARG ARCH=
FROM ${ARCH}golang:1.16-alpine3.13 AS build

WORKDIR /go/src/dragonfly

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

ARG ARCH=
FROM ${ARCH}alpine:3.13 AS run

WORKDIR /dragonfly
COPY --from=build /go/bin/dragonfly /bin/dragonfly

CMD ["/bin/dragonfly"]
