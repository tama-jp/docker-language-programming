# docker-setup-language-programming

## 言語バージョン

| BaseOS                        | アーキテクチャ　 |
|-------------------------------|----------|
| debian:bullseye-20230703-slim | amd用     |

| 言語      | バージョン                                    |
|---------|------------------------------------------|
| rust    | rustc 1.81.0 (eeb90cda1 2024-09-04)      |
| Go言語    | go version go1.23.1 linux/amd64          |
| Node.js | v20.17.0                                 |
| Python3 | Python 3.12.6                            |
| Java    | openjdk version "23" 2024-09-17          |
| Clang   | Debian clang version 16.0.6 (15~deb11u2) |

タグ一覧

| 内容                                           | バージョン                                                                             |
|----------------------------------------------|-----------------------------------------------------------------------------------|
| rust                                         | v-r-202409241130-r1.81.0                                                          | 
| golang                                       | v-g-202409241130-g1.23.1                                                          |                                 
| Python3                                      | v-p-202409241130-p3.12.6                                                          |                                 
| Node.js                                      | v-n-202409241130-n20.17.0                                                         |                                 
| Java                                         | v-j-202409241130-j23-2024-09-17                                                   |                                 
| Clang                                        | v-c-202409241130-clang16.0.6                                                      |                                 
| go + Python3                                 | v-gp-202409241130-g1.23.1-p3.12.6                                                 |                                 
| go + Python3 + Java                          | v-gpj-202409241130-g1.23.1-p3.12.6-j23-2024-09-17                                 |                                 
| go + Python3 + Node.js                       | v-gpn-202409241130-g1.23.1-p3.12.6-n20.17.0                                       |                                 
| go + Python3 + Node.js + Java                | v-gpnj-202409241130-g1.23.1-p3.12.6-n20.17.0-j23-2024-09-17                       |                                 
| go + Python3 + Node.js + Java + Clang        | v-gpnjc-202409241130-g1.23.1-p3.12.6-n20.17.0-j23-2024-09-17-clang16.0.6          |                                 
| go + Python3 + Node.js + Java + Clang + rust | v-gpnjcr-202409241130-g1.23.1-p3.12.6-n20.17.0-j23-2024-09-17-clang16.0.6-r1.81.0 |                                 

| 内容                                           | DockerComposeでのテスト                                              | 　 バージョンチェック                                                                                                                                                     |
|----------------------------------------------|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| rust                                         | docker-compose up --build rust                                  | docker-compose exec rust sh -c "rustc -V && uname -m"                                                                                                                  |
| golang                                       | docker-compose up --build golang                                | docker-compose exec golang sh -c "go version && uname -m"                                                                                                               |
| Node.js                                      | docker-compose up --build nodejs                                | docker-compose exec nodejs sh -c "node --version && uname -m"                                                                                                           |
| Python3                                      | docker-compose up --build python3                               | docker-compose exec python3 sh -c "python3 --version  && uname -m"                                                                                                      |
| Java                                         | docker-compose up --build java                                  | docker-compose exec java sh -c "java -version && uname -m"                                                                                                              |
| Clang                                        | docker-compose up --build clang                                 | docker-compose exec clang sh -c "clang -v && uname -msh -c                                                                                                                   |
| go + Python3                                 | docker-compose up --build golang-python3                        | docker-compose exec golang-python3 sh -c "go version && python3 --version && uname -m"                                                                                 |
| go + Python3 + Java                          | docker-compose up --build golang-python3-java                   | docker-compose exec golang-python3-java sh -c "go version && python3 --version && java -version && uname -m"                                                           |
| go + Python3 + Node.js                       | docker-compose up --build golang-python3-nodejs                 | docker-compose exec golang-python3-nodejs sh -c "go version && python3 --version && node --version && uname -m"                                                        |
| go + Python3 + Node.js + Java                | docker-compose up --build golang-python3-nodejs-java            | docker-compose exec golang-python3-nodejs-java sh -c "go version && python3 --version && node --version && java -version && uname -m"                                  |
| go + Python3 + Node.js + Java + Clang        | docker-compose up --build golang-python3-nodejs-java-clang      | docker-compose exec golang-python3-nodejs-java-clang sh -c "go version && python3 --version && node --version && java -version && clang -v && uname -m"                |
| go + Python3 + Node.js + Java + Clang + rust | docker-compose up --build golang-python3-nodejs-java-clang-rust | docker-compose exec golang-python3-nodejs-java-clang-rust sh -c "go version && python3 --version && node --version && java -version && clang -v && rustc -V && uname -m" |

| 内容                                           | 中に入る                                                              |
|----------------------------------------------|-------------------------------------------------------------------|
| rust                                         | docker-compose exec rust /bin/sh                                  |
| golang                                       | docker-compose exec golang /bin/sh                                |
| Node.js                                      | docker-compose exec nodejs /bin/sh                                |
| Python3                                      | docker-compose exec python3 /bin/sh                               |
| Java                                         | docker-compose exec java /bin/sh                                  |
| Clang                                        | docker-compose exec clang /bin/sh                                 |
| go + Python3                                 | docker-compose exec golang-python3 /bin/sh                        |
| go + Python3 + Java                          | docker-compose exec golang-python3-java /bin/sh                   |
| go + Python3 + Node.js                       | docker-compose exec golang-python3-nodejs /bin/sh                 |
| go + Python3 + Node.js + Java                | docker-compose exec golang-python3-nodejs-java /bin/sh            |
| go + Python3 + Node.js + Java + Clang        | docker-compose exec golang-python3-nodejs-java-clang /bin/sh      |
| go + Python3 + Node.js + Java + Clang + rust | docker-compose exec golang-python3-nodejs-java-clang-rust /bin/sh |

docker-compose exec web /bin/sh

clang
https://e-penguiner.com/install-latest-clang/



```
docker builder prune
```