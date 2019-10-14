FROM ubuntu:bionic

RUN apt-get update && apt-get install -y wget parted sudo udev && rm -rf /var/lib/apt/lists/*

COPY pishrink.sh /usr/local/bin/pishrink

WORKDIR /root

ENTRYPOINT ["/usr/local/bin/pishrink"]
