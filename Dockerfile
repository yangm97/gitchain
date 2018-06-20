FROM golang:alpine3.6 as builder
ARG REPO=github.com/gitchain/gitchain
RUN apk add --no-cache git make
WORKDIR /go/src/$REPO
COPY Godeps ./Godeps
COPY Makefile .
RUN make prepare
COPY / ./
RUN make gitchain
# WORKAROUND
RUN cp gitchain /tmp

FROM alpine:3.6
WORKDIR /data
VOLUME /data
EXPOSE 3000 31000
ENTRYPOINT ["gitchain", "-d", "/data"]
# COPY --from=builder /go/src/$REPO/gitchain /usr/local/bin/
COPY --from=builder /tmp/gitchain /usr/local/bin/
