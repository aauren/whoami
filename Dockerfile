FROM golang:1-alpine AS builder

RUN apk --no-cache --no-progress add git ca-certificates tzdata make termshark \
    tcpdump curl vim bmon wget net-tools less jq traceroute bash strace tshark tcpflow \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

WORKDIR /go/whoami

# Download go modules
COPY go.mod .
COPY go.sum .
RUN GO111MODULE=on GOPROXY=https://proxy.golang.org go mod download

COPY . .

RUN make build

RUN cp /go/whoami/whoami /whoami

ENTRYPOINT ["/whoami"]
EXPOSE 80
