FROM oraclelinux:9

ARG user=squid
ARG group=squid
ARG uid=8484
ARG gid=8484

RUN yum --showduplicates list squid
RUN yum install -y --setopt=tsflags=nodocs  --setopt=override_install_langs=en_US.utf8 \
  squid-5.5 && \
yum clean all


# Decrease the size of the image a bit
RUN rm -rf /var/cache/yum/

# Inject entrypoint
COPY entrypoint.sh /
COPY squid.conf /etc/squid/squid.conf
RUN groupadd -g $gid $group; \
    useradd -d "/" -u $uid -g $gid -M -r $user; \
    touch /run/squid.pid; \
    chown -R $user:$group /var/log/squid /var/spool/squid/ /run/squid.pid


USER $user:$group


ENTRYPOINT [ "/entrypoint.sh" ]

