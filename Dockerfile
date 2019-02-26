FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ARG VERSION=2.6.0
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates=20180409 git=1:2.17.1-1ubuntu0.4 openssh-client=1:7.6p1-4 vim-nox=2:8.0.1453-1ubuntu1 wget=1.19.4-1ubuntu2.1 && rm -rf /var/lib/apt/lists/*
RUN wget -O hub.tgz "https://github.com/github/hub/releases/download/v${VERSION}/hub-linux-amd64-${VERSION}.tgz"
RUN tar -xvf hub.tgz --strip-components 1 -C /usr/local;