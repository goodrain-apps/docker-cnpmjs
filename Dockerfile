FROM node:6.10.2-slim


# Working enviroment
ENV APPDIR /app/cnpmjs.org
ENV CNPMJS_ORG_VERSION 2.19.4

RUN \
  mkdir /app && \
  install -o www-data -d /app && \
  mkdir /var/www && chown www-data:www-data -R /var/www

RUN \
  wget -P /tmp https://github.com/cnpm/cnpmjs.org/archive/${CNPMJS_ORG_VERSION}.tar.gz && \
  tar xvzf /tmp/${CNPMJS_ORG_VERSION}.tar.gz -C /app && \
  mv /app/cnpmjs.org-${CNPMJS_ORG_VERSION} ${APPDIR}

COPY config.js ${APPDIR}/config/config.js

WORKDIR ${APPDIR}

RUN npm install  --registry==https://registry.npm.taobao.org \
    && rm -rf /root/.npm \
    && chown  www-data /app /var/www  -R

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 7001 7002

USER www-data

# Entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
