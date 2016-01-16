FROM node:4

RUN npm install -g -q npm \
  && npm install -g -q yo bower gulp jasmine karma-cli tsd
# chmod 755 /usr/local/lib/node_modules/

### Create user to fix yeoman problem with root ################################
# Error: EACCES, permission denied '/root/.config/configstore/insight-yo.json'
################################################################################
RUN adduser --disabled-password --gecos "" yeoman;
USER yeoman
WORKDIR /home/yeoman

RUN npm install -q generator-nitro \
  && mkdir nitro

WORKDIR nitro

EXPOSE 8080
VOLUME ["/home/yeoman/nitro"]
ENV NITRO_PRE less
ENV NITRO_JS JavaScript

CMD yes "" | yo nitro --no-insight --pre=$NITRO_PRE --js=$NITRO_JS && node server.js
