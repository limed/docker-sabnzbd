# vim: set filetype=dockerfile
FROM limed/ubuntu-base:14.04
MAINTAINER limed@sudoers.org

RUN add-apt-repository -y  ppa:jcfp/ppa \
    && add-apt-repository -y ppa:jcfp/sab-addons \
    && apt-get -q update \
    && apt-get install -qy --force-yes  sabnzbdplus\
                                        par2 \
                                        par2-tbb \
                                        python-sabyenc \
                                        python-yenc \
                                        unzip \
                                        unrar \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

# mkdir directories
RUN mkdir -p /config && \
    mkdir -p /data/sabnzbd/downloads && \
    mkdir -p /data/sabnzbd/nzb && \
    chmod 777 /data/sabnzbd/downloads

# Other volumes here
VOLUME /config
VOLUME /data/sabnzbd/downloads
VOLUME /data/sabnzbd/nzb

# copy supervisord
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080
EXPOSE 9090

CMD [ "/usr/bin/supervisord" ]
