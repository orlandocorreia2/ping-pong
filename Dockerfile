FROM node:22.12

LABEL maintainer="Orlando Nascimento <ocnasicmento2@gmail.com>"

WORKDIR /usr/src

RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
  # TOOLS
  curl \
  git \
  unzip \
  # CLEAR
  && apt-get clean

# Instalação das dependências do sistema
RUN apt-get update && apt-get install -y \
  libx11-xcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxi6 \
  libxtst6 \
  libnss3 \
  fonts-liberation \
  libasound2 \
  xdg-utils \
  --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

RUN npx -y playwright@1.51.1 install --with-deps

RUN npx playwright install

EXPOSE 3000

COPY . .

ENTRYPOINT ["./.docker/start.sh"]
