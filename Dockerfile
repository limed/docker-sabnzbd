# vim: set filetype=dockerfile
FROM limed/ubuntu-base:latest
MAINTAINER limed@sudoers.org

RUN add-apt-repository -y  ppa:jcfp/ppa \
    && apt-get -q update \
    && apt-get install -qy --force-yes  sabnzbdplus\
                                        par2 \
                                        python-yenc \
                                        unzip \
                                        unrar \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

# mkdir directories
CMD [ "mkdir -p /nzb", "mkdir -p /config", "mkdir -p /downloads" ]

# Create various nzb directories
CMD [ "mkdir -p /nzb/daemon.bak", "mkdir -p /nzb/daemon.cache", "mkdir -p /nzb/daemon.incomplete", "mkdir -p /nzb/daemon.queue" ]

VOLUME /nzb
VOLUME /config
VOLUME /downloads

# copy supervisord
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080 9090

CMD [ "/usr/bin/supervisord" ]
