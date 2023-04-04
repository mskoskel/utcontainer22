FROM registry.hub.docker.com/library/ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && \ 
apt-get -y upgrade 

RUN apt-get install -y \
curl \
dnsutils \
mysql-client \ 
nano \
netcat \
nmap \
lynx \
postgresql-client \
ssh \
stress \
telnet \
traceroute \
vim

# Podman
# - libcontainers version 22.04 needed by Podman is not yet ready (13.04.2022)
#
RUN apt-get install -y \
wget \
gnupg2 \
systemd \
buildah \
skopeo

RUN . /etc/os-release
RUN sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_21.04/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
RUN wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_21.04/Release.key -O- > /tmp/podman.key
RUN apt-key add < /tmp/podman.key
RUN apt-get install -y podman
RUN mkdir /run/systemd/journal

RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /tmp/podman.key

USER root
RUN groupadd -g 1001820000 appgrp && useradd -l -r -d /home/appuser -u 1001820000 -g appgrp appuser
USER appuser

# Run the container in the background
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
