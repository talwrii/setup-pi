FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y \
    proot \
    qemu-user-static \
    python3 \
    strace \
    iputils-ping \
    curl \
    && rm -rf /var/lib/apt/lists/*
COPY setup-raspios-docker /usr/local/bin/setup-raspios-docker
RUN chmod +x /usr/local/bin/setup-raspios-docker
ENTRYPOINT ["/usr/local/bin/setup-raspios-docker"]
