#!/usr/bin/env bash

# ■ go言語
# https://go.dev/dl/

echo install golang

apt remove golang-go

export GOPATH=/usr/local/go-packages
export GO_ROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:${GOPATH}/bin

cd /usr/local
apt install -y curl
curl -s -o /tmp/go.tar.gz https://storage.googleapis.com/golang/go$GOVERSION.linux-$ARCH.tar.gz && \
    tar xvf /tmp/go.tar.gz && \
    rm /tmp/go.tar.gz

#go get -u -v github.com/ramya-rao-a/go-outline
#go get -u -v github.com/acroca/go-symbols
#go get -u -v github.com/nsf/gocode
#go get -u -v github.com/rogpeppe/godef
#go get -u -v golang.org/x/tools/cmd/godoc
#go get -u -v github.com/zmb3/gogetdoc
#go get -u -v golang.org/x/lint/golint
#go get -u -v github.com/fatih/gomodifytags
#go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
#go get -u -v golang.org/x/tools/cmd/gorename
#go get -u -v sourcegraph.com/sqs/goreturns
#go get -u -v github.com/cweill/gotests/...
#go get -u -v golang.org/x/tools/cmd/guru
#go get -u -v github.com/josharian/impl
#go get -u -v github.com/haya14busa/goplay/cmd/goplay
#go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
