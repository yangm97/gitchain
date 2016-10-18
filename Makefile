SOURCES=$(wildcard *.go **/*.go **/**/*.go)

all: gitchain

gitchain: $(SOURCES) ui/bindata.go
	go build

test:
	go test ./keys ./block ./transaction ./db ./git

ui/bindata.go: ui $(filter-out ui/bindata.go, $(wildcard ui/**)) Makefile
	go-bindata -pkg=ui -o=ui/bindata.go -ignore=\(bindata.go\|\.gitignore\) -prefix=ui ui

prepare:
	go get github.com/jteeuwen/go-bindata/go-bindata
	go get github.com/tools/godep
	go get github.com/stretchr/testify/assert
	godep restore

clean:
	rm -f ./gitchain
	rm -rf ./gitchain*.db

# Build in linux docker container. Due to the go version
# something similar needs to be done for osx as well.
docker-linux:
	docker run --rm -it -v $(shell pwd):/go/src/github.com/gitchain/gitchain -w /go/src/github.com/gitchain/gitchain golang:1.2.2 make prepare gitchain