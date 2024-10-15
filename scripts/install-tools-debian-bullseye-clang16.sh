#!/usr/bin/env bash

echo "Installing clangd"

# 依存パッケージをインストール
apt -y install wget gnupg

# LLVM リポジトリを追加
echo 'deb http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-16 main' >> /etc/apt/sources.list
echo 'deb-src http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-16 main' >> /etc/apt/sources.list

# GPG キーの追加
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

# パッケージリストの更新
apt-get update --fix-missing

# clang 16 のインストール
apt-get -y install clang-16 || echo "clang-16 installation failed"

# clang のパスを設定
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-16 1
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-16 1
