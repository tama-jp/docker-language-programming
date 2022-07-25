# docker-setup-language-programming
## 言語バージョン

| 言語      | バージョン  |
|---------|--------|
| Go言語    | 1.18.4 |
| Python3 | 3.10.5 |
| Java    | 11     |
| Clang   | 14     |

タグ一覧

| 内容                                    | バージョン                                                         |
|---------------------------------------|---------------------------------------------------------------|
| golang                                | v-g-202207251900-g1.18.4                                      |
| Python3                               | v-p-202207251900-p3.10.5                                      |
| Node.js                               | v-n-202207251900-n18.6.0                                      |
| Java                                  | v-j-202207251900-j11.0.15                                     |
| Clang                                 | v-c-202207251900-clang14                                      |
| go + Python3                          | v-gp-202207251900-g1.18.4-p3.10.5                             |
| go + Python3 + Node.js                | v-gpn-202207251900-g1.18.4-p3.10.5-n18.6.0                    |
| go + Python3 + Node.js + Java         | v-gpnj-202207251900-g1.18.4-p3.10.5-n18.6.0-j11.0.15          |
| go + Python3 + Node.js + Java + Clang | v-gpnjc-202207251900-g1.18.4-p3.10.5-n18.6.0-j11.0.15-clang14 |


| 内容                                    | DockerComposeでのテスト                                         |
|---------------------------------------|------------------------------------------------------------|
| golang                                | docker-compose up --build golang                           |
| Node.js                               | docker-compose up --build nodejs                           |
| Python3                               | docker-compose up --build python3                          |
| Java                                  | docker-compose up --build java                             |
| Clang                                 | docker-compose up --build clang                            |
| go + Python3                          | docker-compose up --build golang-python3                   |
| go + Python3 + Node.js                | docker-compose up --build golang-python3-nodejs            |
| go + Python3 + Node.js + Java         | docker-compose up --build golang-python3-nodejs-java       |
| go + Python3 + Node.js + Java + Clang | docker-compose up --build golang-python3-nodejs-java-clang |


| 内容                                    | 中に入る                                                         |
|---------------------------------------|--------------------------------------------------------------|
| golang                                | docker-compose exec golang /bin/sh                           |
| Node.js                               | docker-compose exec nodejs /bin/sh                           |
| Python3                               | docker-compose exec python3 /bin/sh                          |
| Java                                  | docker-compose exec java /bin/sh                             |
| Clang                                 | docker-compose exec clang /bin/sh                            |
| go + Python3                          | docker-compose exec golang-python3 /bin/sh                   |
| go + Python3 + Node.js                | docker-compose exec golang-python3-nodejs /bin/sh            |
| go + Python3 + Node.js + Java         | docker-compose exec golang-python3-nodejs-java /bin/sh       |
| go + Python3 + Node.js + Java + Clang | docker-compose exec golang-python3-nodejs-java-clang /bin/sh |



docker-compose exec web /bin/sh





