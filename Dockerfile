FROM node:6.10.2-slim


# Working enviroment
ENV APPDIR /app/cnpmjs.org
ENV CNPMJS_ORG_VERSION 2.19.4

RUN \
  mkdir /app && \
  install -o www-data -d /app && \
  mkdir /var/www && chown www-data:www-data -R /var/www

USER www-data

RUN \
  wget -P /tmp https://github.com/cnpm/cnpmjs.org/archive/${CNPMJS_ORG_VERSION}.tar.gz && \
  tar xvzf /tmp/${CNPMJS_ORG_VERSION}.tar.gz -C /app && \
  mv /app/cnpmjs.org-${CNPMJS_ORG_VERSION} ${APPDIR}

WORKDIR ${APPDIR}

RUN npm install  --registry==https://registry.npm.taobao.org

EXPOSE 7001 7002

# Entrypoint
CMD ["/usr/local/bin/node", "/app/cnpmjs.org/dispatch.js"]
