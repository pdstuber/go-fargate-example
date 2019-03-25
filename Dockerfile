FROM golang:alpine as BUILDER
ENV GO111MODULE on
WORKDIR /go/src/github.com/pdstuber/go-fargate-example
RUN apk add bash ca-certificates git gcc g++ libc-dev
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY *.go .
RUN GOOS=linux GOARCH=amd64 go build

FROM alpine
ENV GIN_MODE release
COPY --from=BUILDER /go/src/github.com/pdstuber/go-fargate-example/go-fargate-example .
ENTRYPOINT ["/go-fargate-example"]
