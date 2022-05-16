#!/usr/bin/env bash

echo install java

apt update && apt -y install openjdk-${JAVA_VERSION}-jdk
