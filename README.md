# docker-setup-language-programming
## 言語バージョン

| BaseOS                        |
|-------------------------------|
| debian:bullseye-20230109-slim | 


| 言語      | バージョン                               |
|---------|-------------------------------------|
| rust    | rustc 1.66.1 (90743e729 2023-01-10) |
| Go言語    | go version go1.19.5 linux/amd64     |
| Node.js | v18.13.0                            |
| Python3 | 3.11.1                              |
| Java    | "17.0.4" 2022-07-19                 |
| Clang   | 15.0.7                              |

タグ一覧

| 内容                                           | バージョン                                                                      |
|----------------------------------------------|----------------------------------------------------------------------------|
| rust                                         | v-r-202301190900-r1.66.1                                                   | 
| golang                                       | v-g-202301190900-g1.19.5                                                   |                                 
| Python3                                      | v-p-202301190900-p3.11.1                                                   |                                 
| Node.js                                      | v-n-202301190900-n18.13.0                                                  |                                 
| Java                                         | v-j-202301190900-j17.0.4                                                   |                                 
| Clang                                        | v-c-202301190900-clang15.0.7                                               |                                 
| go + Python3                                 | v-gp-202301190900-g1.19.5-p3.11.1                                          |                                 
| go + Python3 + Java                          | v-gpj-202301190900-g1.19.5-p3.11.1-j17.0.4                                 |                                 
| go + Python3 + Node.js                       | v-gpn-202301190900-g1.19.5-p3.11.1-n18.13.0                                |                                 
| go + Python3 + Node.js + Java                | v-gpnj-202301190900-g1.19.5-p3.11.1-n18.13.0-j17.0.4                       |                                 
| go + Python3 + Node.js + Java + Clang        | v-gpnjc-202301190900-g1.19.5-p3.11.1-n18.13.0-j17.0.4-clang15.0.7          |                                 
| go + Python3 + Node.js + Java + Clang + rust | v-gpnjcr-202301190900-g1.19.5-p3.11.1-n18.13.0-j17.0.4-clang15.0.7-r1.66.1 |                                 


| 内容                                           | DockerComposeでのテスト                                              | 　 バージョンチェック                                     |
|----------------------------------------------|-----------------------------------------------------------------|-------------------------------------------------|
| rust                                         | docker-compose up --build rust                                  | docker-compose exec rust rustc -V               |
| golang                                       | docker-compose up --build golang                                | docker-compose exec golang go version           |
| Node.js                                      | docker-compose up --build nodejs                                | docker-compose exec nodejs node --version       |
| Python3                                      | docker-compose up --build python3                               | docker-compose exec python3  python3 --version  |
| Java                                         | docker-compose up --build java                                  | docker-compose exec java java -version          |
| Clang                                        | docker-compose up --build clang                                 | docker-compose exec clang clang -v              |
| go + Python3                                 | docker-compose up --build golang-python3                        |                                                 |
| go + Python3 + Java                          | docker-compose up --build golang-python3-java                   |                                                 |
| go + Python3 + Node.js                       | docker-compose up --build golang-python3-nodejs                 |                                                 |
| go + Python3 + Node.js + Java                | docker-compose up --build golang-python3-nodejs-java            |                                                 |
| go + Python3 + Node.js + Java + Clang        | docker-compose up --build golang-python3-nodejs-java-clang      |                                                 |
| go + Python3 + Node.js + Java + Clang + rust | docker-compose up --build golang-python3-nodejs-java-clang-rust |                                                 |


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

