FROM ubuntu:22.04
RUN apt-get update && apt-get install -y isc-dhcp-server iproute2 && rm -rf /var/lib/apt/lists/*
# dhcpd requires a leases file present
RUN mkdir -p /var/lib/dhcp && touch /var/lib/dhcp/dhcpd.leases
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
# Expose is informational; host mode will bypass it
EXPOSE 67/udp
# Default: foreground, debug, IPv4, use our config
CMD ["sh", "-c", "dhcpd -4 -f -d -cf /etc/dhcp/dhcpd.conf"]

