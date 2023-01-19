# https://zenn.dev/matsukaz/articles/31bc31ff1c54b4
# https://qiita.com/mykysyk@github/items/26926aa98c1591b2f1ed

# https://github.com/lima-vm/lima

# https://qiita.com/mm_sys/items/28a0217256b56918fee4
# https://github.com/lima-vm/lima/blob/f32d795ad775b33680d6f7283e58c5d17e98d382/examples/default.yaml#L92

# https://zenn.dev/wim/articles/build_lima_environment_on_m1_mac
# https://github.com/lima-vm/lima/issues/231

## macOSのファイルディスクリプタの上限の引き上げ

macOSとLimaは、現バージョンではSSHFSでファイル共有を行っています。
その関係で、Docker内でのファイル操作であってもmacOS側でもファイルアクセスが行われるため、ファイルディスクリプタの上限に引っかかりやすくなっています（macOSはデフォルトで256が上限）

検証時は、Dockerコンテナ内でsprite画像を生成した際に、途中で Operation not permitted : open というエラーが発生しました。
まさかこのエラー内容からmacOS側のファイルディスクリプタの上限に引っかかってるとは思わず、原因の特定にかなり苦労しました…。

macOSのファイルディスクリプタの上限を引き上げる方法は以下になります。

/Library/LaunchDaemons/limit.maxfiles.plist ファイルを作成

```
<?xml version="1.0" encoding="UTF-8"?>  
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"  
          "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>limit.maxfiles</string>
      <key>ProgramArguments</key>
      <array>
        <string>launchctl</string>
        <string>limit</string>
        <string>maxfiles</string>
        <string>64000</string>
        <string>64000</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>ServiceIPC</key>
      <false/>
    </dict>
  </plist>
```

## ファイルのオーナーをrootに変更

```
sudo chown root /Library/LaunchDaemons/limit.maxfiles.plist
```

## 設定の有効化

```
sudo launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist
```

## 設定の無効化
```
sudo launchctl unload /Library/LaunchDaemons/limit.maxfiles.plist
```

## macOSを再起動

## 反映の確認

```
❯ ulimit -a
-t: cpu time (seconds)              unlimited
-f: file size (blocks)              unlimited
-d: data seg size (kbytes)          unlimited
-s: stack size (kbytes)             8192
-c: core file size (blocks)         0
-v: address space (kbytes)          unlimited
-l: locked-in-memory size (kbytes)  unlimited
-u: processes                       2784
-n: file descriptors                64000
```

## 環境構築

brewでインストールするだけです。簡単。

```
brew install lima
```


lima.ymlファイル作成
以下の内容の lima_sample.yml ファイルを作成します。
内容はlimaのリポジトリに含まれている [Dockerのexample](https://github.com/lima-vm/lima/blob/master/examples/docker.yaml) を利用しています。

作業ディレクトリをマウントするため、mountsのlocation指定を必要に応じて修正します。

docker.yml
```
# Example to use Docker instead of containerd & nerdctl
# $ limactl start ./docker.yaml
# $ limactl shell docker docker run -it -v $HOME:$HOME --rm alpine

# To run `docker` on the host (assumes docker-cli is installed):
# $ export DOCKER_HOST=$(limactl list docker --format 'unix://{{.Dir}}/sock/docker.sock')
# $ docker ...

# This example requires Lima v0.8.0 or later
images:
# Try to use release-yyyyMMdd image if available. Note that release-yyyyMMdd will be removed after several months.
- location: "https://cloud-images.ubuntu.com/releases/22.04/release-20221117/ubuntu-22.04-server-cloudimg-amd64.img"
  arch: "x86_64"
  digest: "sha256:dc5b5a43c26768b56e00c23da707a0f69103ba947edf298033dbcd1f9f18a5c6"
- location: "https://cloud-images.ubuntu.com/releases/22.04/release-20221117/ubuntu-22.04-server-cloudimg-arm64.img"
  arch: "aarch64"
  digest: "sha256:61b29e585d5b3540a272f4777552453205d46e65d8b70108560f105deeac1068"
# Fallback to the latest release image.
# Hint: run `limactl prune` to invalidate the cache
- location: "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img"
  arch: "x86_64"
- location: "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-arm64.img"
  arch: "aarch64"

cpus: 4
memory: "8GiB"
disk: "100GiB"

mountType: "9p" 
mounts:
- location: "~"
  # writable: false
  writable: true
  9p:
    securityModel: mapped-xattr
    cache: "mmap"
- location: "~/Documents/workspaces"
# - location: "/tmp/lima"
  writable: true
  9p:
    securityModel: mapped-xattr
    cache: "mmap"
ssh:
  localPort: 60006
  loadDotSSHPubKeys: true
# containerd is managed by Docker, not by Lima, so the values are set to false here.
containerd:
  system: false
  # user: false
  user: true
# mountType: null
provision:
- mode: system
  # This script defines the host.docker.internal hostname when hostResolver is disabled.
  # It is also needed for lima 0.8.2 and earlier, which does not support hostResolver.hosts.
  # Names defined in /etc/hosts inside the VM are not resolved inside containers when
  # using the hostResolver; use hostResolver.hosts instead (requires lima 0.8.3 or later).
  script: |
    #!/bin/sh
    sed -i 's/host.lima.internal.*/host.lima.internal host.docker.internal/' /etc/hosts
- mode: system
  script: |
    #!/bin/bash
    set -eux -o pipefail
    command -v docker >/dev/null 2>&1 && exit 0
    export DEBIAN_FRONTEND=noninteractive
    curl -fsSL https://get.docker.com | sh
    # NOTE: you may remove the lines below, if you prefer to use rootful docker, not rootless
    systemctl disable --now docker
    apt-get install -y uidmap dbus-user-session
- mode: user
  script: |
    #!/bin/bash
    set -eux -o pipefail
    systemctl --user start dbus
    dockerd-rootless-setuptool.sh install
    docker context use rootless
probes:
- script: |
    #!/bin/bash
    set -eux -o pipefail
    if ! timeout 30s bash -c "until command -v docker >/dev/null 2>&1; do sleep 3; done"; then
      echo >&2 "docker is not installed yet"
      exit 1
    fi
    if ! timeout 30s bash -c "until pgrep rootlesskit; do sleep 3; done"; then
      echo >&2 "rootlesskit (used by rootless docker) is not running"
      exit 1
    fi
  hint: See "/var/log/cloud-init-output.log". in the guest
hostResolver:
  # hostResolver.hosts requires lima 0.8.3 or later. Names defined here will also
  # resolve inside containers, and not just inside the VM itself.
  hosts:
    host.docker.internal: host.lima.internal
portForwards:
- guestSocket: "/run/user/{{.UID}}/docker.sock"
  hostSocket: "{{.Dir}}/sock/docker.sock"
message: |
  To run `docker` on the host (assumes docker-cli is installed), run the following commands:
  ------
  docker context create lima-{{.Name}} --docker "host=unix://{{.Dir}}/sock/docker.sock"
  docker context use lima-{{.Name}}
  docker run hello-world
  ------
```

Lima VMの起動
初回起動時
ymlを指定して起動します

```
limactl start docker.yml
```

初回の場合は、

Proceed with the default configuration
Open an editor to override the configuration
の選択肢を聞かれるため、 Proceed with the default configuration を選択します。


2回目以降の起動時
2回目以降はファイルではなくLima VMの名前を指定して起動します。

```
limactl start docker
```

Lima上のDockerへのアクセス準備
Lima上で動作しているDockerを利用するためには ~/.lima/docker/sock/docker.sock を利用します。
このままではDocker Desktop for Macの環境と異なるため、 /var/run/docker.sock にシンボリックリンクを作成します。

```
sudo ln -sf ~/.lima/docker/sock/docker.sock /var/run/docker.sock
```

手軽に切り替えたい場合は、 DOCKER_HOST で指定することもできます。

```
export DOCKER_HOST=unix://$HOME/.lima/docker/sock/docker.sock
```

Lima VMの状態確認
$ limactl list
NAME              STATUS     SSH                ARCH      CPUS    MEMORY    DISK      DIR
lima_sample       Running    127.0.0.1:60006    x86_64    4       8GiB      100GiB    /Users/xxxx/.lima/lima_sample

% limactl shell docker
DockerVMの停止

% limactl stop docker
DockerVMの起動(２回目以降)


% limactl start docker
DockerVMの削除

% limactl delete docker


Docker Composeも入れてみる
Dockerコマンドが利用できるようになったので、Doker Composeも入れてみます。
こちらもHomeBrewから簡単に導入することが出来ます

```
brew install docker-compose
```

% brew install lima docker
docker-compose を使う予定がある場合
docker-compose のインストール

$ brew install docker-compose
$ mkdir -p ~/.docker/cli-plugins
$ ln -sfn /usr/local/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

brew reinstall docker

# lima
# export DOCKER_HOST=unix://$HOME/.lima/docker/sock/docker.sock


```
docker compose up -d
```


limactl list

limactl stop docker
limactl delete docker

limactl start docker.yml


limactl start docker


limactl stop docker
limactl delete docker

brew install lima

limactl start docker.yml

limactl shell docker

sudo apt  install docker-compose 
