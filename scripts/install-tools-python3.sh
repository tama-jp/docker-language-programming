#!/usr/bin/env bash

## ■ Python
# https://computingforgeeks.com/how-to-install-python-latest-debian/

echo install python3

mkdi -p /usr/src
cd /usr/src
#apt update && apt install -y python3 python3-pip
#pip3 install python-language-server

apt update -y
apt remove -y python3-distutils python3 && \
apt install -y curl git \
               software-properties-common build-essential \
               libnss3-dev zlib1g-dev libgdbm-dev libncurses5-dev \
               libssl-dev libffi-dev libreadline-dev libsqlite3-dev libbz2-dev

## ■ Python
# https://computingforgeeks.com/how-to-install-python-latest-debian/


curl -s -o /tmp/Python-$PYTHONVERSION.tgz  https://www.python.org/ftp/python/$PYTHONVERSION/Python-$PYTHONVERSION.tgz
tar xvf /tmp/Python-$PYTHONVERSION.tgz
rm -rf /tmp/Python-$PYTHONVERSION.tgz
cd /usr/src/Python-$PYTHONVERSION
./configure --enable-optimizations
make altinstall
ln -s /usr/local/bin/python$PYTHONVERSIONBIN /usr/local/bin/python3
ln -s /usr/local/bin/pip$PYTHONVERSIONBIN /usr/local/bin/pip3

python3 -m pip install --upgrade pip
