FROM debian:9
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"
LABEL version="1.0.0"

ENV DEBIAN_FRONTEND=noninteractive

# Apt update and upgrade
RUN \
  apt-get -qq update && \
  apt-get -qq dist-upgrade -y;

# Install basic packages and common dependencies
RUN \
  apt-get -qq -y install \
    htop mtr traceroute net-tools tar less vim nano tree curl git snmp nmap \
    apt-transport-https ca-certificates apt-utils software-properties-common \
    libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev \
    libffi-dev libgdbm3 libgdbm-dev bash-completion shellcheck sudo systemd \
    systemd-sysv;

# Clean all
RUN \
  apt-get -qq clean autoclean;

VOLUME ["/sys/fs/cgroup"]
CMD  ["/bin/bash"]
