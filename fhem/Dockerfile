FROM debian:bookworm-slim

ARG FHEM_DEB=fhem-6.4.deb

ENV DEBIAN_FRONTEND="noninteractive"
ENV DEBCONF_NOWARNINGS="yes"
ENV TERM=xterm

RUN echo "\
APT::Install-Recommends "false"; \n\
APT::Install-Suggests "false"; \n\
APT::Get::Assume-Yes "true"; \n\
" > /etc/apt/apt.conf.d/no_recommends
    
RUN touch /sbin/init && touch /etc/apt/sources.list
    
RUN wget http://fhem.de/${FHEM_DEB} \
    && apt-get update && \
    apt-get upgrade && \
    apt-get install \
    bind9-dnsutils ca-certificates curl gnupg2 inetutils-ping libcap2-bin locales net-tools procps pv vim wget && \
    ./${FHEM_DEB} \
    telnet wakeonlan openssh-client \
    libdbd-mysql-perl \
    librpc-xml-perl\
    libwww-perl \
    libsoap-lite-perl \
    libxml-parser-lite-perl libxml-simple-perl \
    libmodule-pluggable-perl \
    && rm -rf /var/lib/apt/lists/* \
    && rm ./${FHEM_DEB} \
    && cd /opt/fhem \
    && rm fhem.cfg \
    && rm log/* \
    && echo "\
attr global modpath .\n\
attr global verbose 3\n\
attr global commandref modular\n\
attr global updateInBackground 1\n\
define initialUpdate notify global:INITIALIZED update\n\
define ShutdownAfterUpdate notify global:UPDATE shutdown\n\
attr global restoreDirs 0\n\
attr global logfile -\n\
" > fhem_update.cfg \
    && /usr/bin/perl fhem.pl fhem_update.cfg \
    && rm fhem_update.cfg

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

WORKDIR /opt/fhem
    
RUN touch log/fhem.log && chown fhem:dialout log/fhem.log

RUN mkdir /data
RUN chown fhem:dialout /data
    
USER fhem
    
RUN mkdir /opt/fhem/.ssh
RUN echo "Host \nHashKnownHosts no\nStrictHostKeyChecking no\m"
    
EXPOSE 8083

COPY run.sh /opt/fhem
CMD /opt/fhem/run.sh
