FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND="noninteractive"
ENV DEBCONF_NOWARNINGS="yes"
ENV TERM=xterm

RUN echo "\
APT::Install-Recommends "false"; \n\
APT::Install-Suggests "false"; \n\
APT::Get::Assume-Yes "true"; \n\
" > /etc/apt/apt.conf.d/no_recommends

RUN apt-get update &&  \
    apt-get install bind9-dnsutils ca-certificates curl gnupg2 inetutils-ping libcap2-bin locales net-tools procps pv vim wget && \
    apt-get install rsync && \
    rm -rf /var/lib/apt/lists/*

    RUN echo 'en_US.UTF-8 UTF-8\nen_GB.UTF-8 UTF-8\nde_DE.UTF-8 UTF-8\n' > /etc/locale.gen && \
    locale-gen && \
    rm /etc/locale.gen && \
    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ENV LANG="en_GB.utf8"
ENV LC_CTYPE=$LANG \
    LC_NUMERIC=$LANG \
    LC_TIME=$LANG \
    LC_COLLATE=$LANG \
    LC_MONETARY=$LANG \
    LC_MESSAGES=$LANG \
    LC_PAPER=$LANG \
    LC_NAME=$LANG \
    LC_ADDRESS=$LANG \
    LC_TELEPHONE=$LANG \
    LC_MEASUREMENT=$LANG \
    LC_IDENTIFICATION=$LANG
  
CMD ["/usr/bin/rsync", "--no-detach", "--daemon"]
  
#       container_name: ${NAME}
#       hostname: ${NAME}
#       image: $IMAGE
#       restart: unless-stopped
#       volumes:
#         - ${MY_CONFIG}/rsyncd.conf:/etc/rsyncd.conf:ro
#         - ${MY_CONFIG}/rsyncd.secret:/etc/rsyncd.secret:ro
#         - /LOCAL/extern/Platte1:/BACKUP1
#         - /LOCAL/extern/Platte2:/BACKUP2
#         - /LOCAL/extern/Platte3:/BACKUP3
#       networks:
#         vlan4:
#           ipv4_address: 192.168.178.12
#       profiles: ["vmx"]
  
#   networks:
#     vlan4:
#       external: True
  