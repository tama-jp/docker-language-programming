#!/usr/bin/env bash

echo install java

#apt update && apt -y install openjdk-${JAVA_VERSION}-jdk
apt install wget -y
mkdir /usr/java
cd /usr/java/

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    echo "This is an x86_64 architecture."
    wget https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-x64_bin.tar.gz
    tar zxvf openjdk-23_linux-x64_bin.tar.gz
    rm -rf openjdk-23_linux-x64_bin.tar.gz
elif [ "$ARCH" = "aarch64" ]; then
    echo "This is an ARM (aarch64) architecture."
    wget https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-aarch64_bin.tar.gz
    tar zxvf openjdk-23_linux-aarch64_bin.tar.gz
    rm -rf openjdk-23_linux-aarch64_bin.tar.gz
else
    echo "Unknown architecture: $ARCH"
fi


