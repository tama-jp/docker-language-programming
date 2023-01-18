# docker-setup-language-programming
## 言語バージョン

| 言語      | バージョン             |
|---------|-------------------|
| Go言語    | 1.19.5            |
| Python3 | 3.11.1            |
| Node.js | 18.13.0           |
| Java    | 19.0.1 2022-10-18 |
| Clang   | 14                |
| rust    | 1.66.1            |

タグ一覧

| 内容                                           | バージョン                                                                  |
|----------------------------------------------|------------------------------------------------------------------------|
| rust                                         | v-r-202301182100-r1.66.1                                               |
| golang                                       | v-g-202301182100-g1.19.5                                               |
| Python3                                      | v-p-202301182100-p3.11.1                                               |
| Node.js                                      | v-n-202301182100-n18.13.0                                              |
| Java                                         | v-j-202301182100-j19.0.1                                               |
| Clang                                        | v-c-202301182100-clang14                                               |
| go + Python3                                 | v-gp-202301182100-g1.19.5-p3.11.1                                      |
| go + Python3 + Java                          | v-gpj-202301182100-g1.19.5-p3.11.1-j19.0.1                             |
| go + Python3 + Node.js                       | v-gpn-202301182100-g1.19.5-p3.11.1-n18.13.0                            |
| go + Python3 + Node.js + Java                | v-gpnj-202301182100-g1.19.5-p3.11.1-n18.13.0-j19.0.1                   |
| go + Python3 + Node.js + Java + Clang        | v-gpnjc-202301182100-g1.19.5-p3.11.1-n18.13.0-j19.0.1-clang14          |
| go + Python3 + Node.js + Java + Clang + rust | v-gpnjcr-202301182100-g1.19.5-p3.11.1-n18.13.0-j19.0.1-clang14-r1.66.1 |


| 内容                                    | DockerComposeでのテスト                                         |
|---------------------------------------|------------------------------------------------------------|
| rust                                  | docker-compose up --build rust                             |
| golang                                | docker-compose up --build golang                           |
| Node.js                               | docker-compose up --build nodejs                           |
| Python3                               | docker-compose up --build python3                          |
| Java                                  | docker-compose up --build java                             |
| Clang                                 | docker-compose up --build clang                            |
| go + Python3                          | docker-compose up --build golang-python3                   |
| go + Python3 + Java                   | docker-compose up --build golang-python3-java              |
| go + Python3 + Node.js                | docker-compose up --build golang-python3-nodejs            |
| go + Python3 + Node.js + Java         | docker-compose up --build golang-python3-nodejs-java       |
| go + Python3 + Node.js + Java + Clang | docker-compose up --build golang-python3-nodejs-java-clang |


| 内容                                    | 中に入る                                                         |
|---------------------------------------|--------------------------------------------------------------|
| rust                                  | docker-compose exec rust /bin/sh                             |
| golang                                | docker-compose exec golang /bin/sh                           |
| Node.js                               | docker-compose exec nodejs /bin/sh                           |
| Python3                               | docker-compose exec python3 /bin/sh                          |
| Java                                  | docker-compose exec java /bin/sh                             |
| Clang                                 | docker-compose exec clang /bin/sh                            |
| go + Python3                          | docker-compose exec golang-python3 /bin/sh                   |
| go + Python3 + Java                   | docker-compose exec golang-python3-java /bin/sh              |
| go + Python3 + Node.js                | docker-compose exec golang-python3-nodejs /bin/sh            |
| go + Python3 + Node.js + Java         | docker-compose exec golang-python3-nodejs-java /bin/sh       |
| go + Python3 + Node.js + Java + Clang | docker-compose exec golang-python3-nodejs-java-clang /bin/sh |


docker-compose exec web /bin/sh





