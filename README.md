# docker-cnpm

docker image of [cnpmjs.org](https://cnpmjs.org/), the "Company NPM" by alibaba ![nodejs-version-badge](https://img.shields.io/badge/node.js->=_6-blue.svg?style=flat-square) ![cnpmjs.org-version-badge](https://img.shields.io/badge/cnpm-2.19.4-blue.svg?style=flat-square)

https://hub.docker.com/r/hbrls/cnpmjs/

# Easy

    $ docker pull hbrls/cnpm:0.0.5
    $ docker run -d \
                 -p 7001:7001 \
                 -p 7002:7002 \
                 -v /path/to/config:/app/cnpmjs.org/config \
                 -v /path/to/customize/README.md:/app/cnpmjs.org/docs/web/readme.md \
                 -v /path/to/storage:/var/www \
                 --name cnpm goodrainapps/cnpm:2.19.4

# Reference

1. [GitHub: cnpm/cnpmjs.org](https://github.com/cnpm/cnpmjs.org)
2. [跟我一起部署和定制 CNPM——基础部署](http://f2e.souche.com/blog/let-cnpm-base-deploy/)
3. [Deploy a private npm registry in 5 minutes](https://github.com/cnpm/cnpmjs.org/wiki/Deploy-a-private-npm-registry-in-5-minutes)
