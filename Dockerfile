FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ARG VERSION=2.6.0
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates=20180409 git=1:2.17.1-1ubuntu0.4 openssh-client=1:7.6p1-4ubuntu0.3 vim-nox=2:8.0.1453-1ubuntu1.1 wget=1.19.4-1ubuntu2.2 && rm -rf /var/lib/apt/lists/*
RUN wget -O hub.tgz "https://github.com/github/hub/releases/download/v${VERSION}/hub-linux-amd64-${VERSION}.tgz"
RUN tar -xvf hub.tgz --strip-components 1 -C /usr/local;

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "github" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "GitHub CLI" \
    org.label-schema.description = "A command-line tool that makes git easier to use with GitHub" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/github" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/github/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/github" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/github" \
    org.label-schema.vcs-ref = "${vcs_ref}" \