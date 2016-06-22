# vim: set filetype=dockerfile
FROM limed/ubuntu-base:latest
MAINTAINER limed@sudoers.org

RUN add-apt-repository -y  ppa:jcfp/ppa && \
    apt-get -q update && \
    apt-get install -qy --force-yes sabnzbdplus\
                                    sabnzbdplus-theme-classic \
                                    sabnzbdplus-theme-mobile \
                                    sabnzbdplus-theme-plush \
                                    par2 \
                                    python-yenc \
                                    unzip \
                                    unrar \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# mkdir directories
CMD [ "mkdir -p /nzb", "mkdir -p /config", "mkdir -p /downloads" ]
VOLUME /nzb /config /downloads

# copy supervisord
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080 9090

CMD [ "/usr/bin/supervisord" ]
