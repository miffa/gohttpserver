
#FROM golang:1.18-alpine as builder
#
#WORKDIR /gohttpserver
## Copy the Go Modules manifests
#COPY . .
#
#RUN apk add gcc
## cache deps before building and copying source so that we don't need to re-download as much
## and so that source changes don't invalidate our downloaded layer
#ENV GOPROXY https://goproxy.cn
#RUN  go mod download
#
#RUN  go build  -a -o gohttpserver main.go

#############
#FROM alpine:3.16
FROM centos:centos7

MAINTAINER miffa

COPY gohttpserver /app/gohttpserver
COPY res /app/res
#COPY --from=builder gohttpserver /app/gohttpserver
#COPY data /app/

WORKDIR /app
RUN mkdir -p data

EXPOSE 8080

ENTRYPOINT ["/app/gohttpserver"]
#ENTRYPOINT ["/app/gohttpserver", "-r", "/app/data", "-a", ":8080"]
#CMD ["/app/gohttpserver", "-r", "/app/data", "-a", ":8080"]
