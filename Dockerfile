FROM debian:jessie
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"
LABEL version="1.0.0"

# Apt update and upgrade
RUN \
  apt-get -qq update && \
  apt-get -qq dist-upgrade -y;

# Install basic packages and common dependencies
RUN \
  apt-get -qq -y install net-tools tar less vim nano tree curl git \
    apt-transport-https ca-certificates apt-utils software-properties-common \
    libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev \
    libffi-dev libgdbm3 libgdbm-dev;

# Clean all
RUN \
  apt-get -qq clean autoclean;

VOLUME ["/sys/fs/cgroup"]
CMD  ["/lib/systemd/systemd"]
