FROM ubuntu:20.04
MAINTAINER Alexandr Linux <baf@bafista.ru>

# LABEL about the custom image
LABEL version="1.00"
LABEL description="This softethervpn server image for \
the docker Synology on ubuntu ppa"
ENV VERSION 5.02.0~202105242329~ubuntu20.04.1

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Install softethervpn server on ubuntu ppa
RUN apt update && \
apt upgrade -y && \
apt install software-properties-common && \
apt-add-repository -y ppa:paskal-07/softethervpn && \
apt update && \
apt install -y softether-vpnserver && \
rm -rf /var/lib/apt/lists/* && \
apt clean

EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp 500/udp 4500/udp

CMD /usr/bin/vpnserver start
