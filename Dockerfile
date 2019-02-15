FROM jenkins/jnlp-slave:3.10-1
MAINTAINER Ludovic Mercier <ludovic.mercier.lm@gmail.com>

USER root

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list \
        && echo "deb http://deb.nodesource.com/node_10.x cosmic main" >> /etc/apt/sources.list \
        && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -\
        && wget -q -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -\
        && apt-get update \
        && apt-get install -y --no-install-recommends \
          google-chrome-stable nodejs \
      && apt-get autoremove -y \
      && rm -rf /var/lib/apt/lists/*

USER jenkins

