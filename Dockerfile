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

EXPOSE 3000

COPY . .

ENTRYPOINT ["./.docker/start.sh"]
