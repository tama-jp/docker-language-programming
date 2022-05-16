#!/usr/bin/env bash

echo install node.js

apt install -y curl

curl -fsSL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash - && \
    apt install -y nodejs

# code-server を取得するのに wget を install しておく
apt install -y wget
