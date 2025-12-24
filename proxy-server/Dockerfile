FROM debian:bullseye-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends squid ca-certificates curl \
 && rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /entrypoint.sh

RUN mkdir -p /var/log/squid /run/squid /var/spool/squid \
 && chown -R proxy:proxy /var/log/squid /run/squid /var/spool/squid

EXPOSE 3128

# Create the cache directory and set correct ownership
RUN mkdir -p /var/spool/squid && chown -R proxy:proxy /var/spool/squid

# Initialize the cache directory
RUN squid -Nz -f /etc/squid/squid.conf

ENTRYPOINT ["/entrypoint.sh"]
