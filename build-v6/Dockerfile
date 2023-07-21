FROM oraclelinux:9-slim AS builder

# Ensure installed tools:

RUN microdnf install --enablerepo ol9_codeready_builder -y perl gcc autoconf automake make sudo wget libxml2-devel libcap-devel libtool-ltdl-devel libtool cmake autoconf-archive gcc-c++ gettext cppunit cppunit-devel git

# Copy and extract squid tar
WORKDIR /tmp/

RUN git clone https://github.com/squid-cache/squid.git && cd squid && git checkout v6 && git pull

# Compile and build squid.
WORKDIR /tmp/squid/
RUN autoreconf --install

RUN autoconf
RUN ./configure \
  --prefix=/usr \
  --includedir=/usr/include \
  --datadir=/usr/share \
  --bindir=/usr/sbin \
  --libexecdir=/usr/lib/squid \
  --localstatedir=/var \
  --sysconfdir=/etc/squid

RUN make all -j 16
RUN make check -j 16


FROM oraclelinux:9-slim

ARG user=squid
ARG group=squid
ARG uid=848
ARG gid=848

# Copy files to run image
WORKDIR /tmp/
RUN mkdir squid
COPY --from=builder /tmp/squid/ ./squid/
RUN ls -lahrt
# install squid
RUN microdnf install --enablerepo ol9_codeready_builder -y make g++ libxml2 libxml2-devel libcap libcap-devel libtool-ltdl libtool-ltdl-devel findutils

WORKDIR /tmp/squid/
RUN make install -j16

WORKDIR /

RUN microdnf install epel-release
RUN microdnf install ncdu
RUN microdnf remove -y make g++ gcc libxml2-devel libcap-devel libtool-ltdl-devel epel-release && microdnf clean all

# Inject entrypoint
COPY ../entrypoint.sh /
COPY ../squid.conf /etc/squid/squid.conf
RUN groupadd -g $gid $group; \
    useradd -d "/" -u $uid -g $gid -M -r $user; \
    touch /run/squid.pid; \
    mkdir -p /var/log/squid /var/spool/squid/; \
    chown -R $user:$group /var/log/squid /var/spool/squid/ /run/squid.pid

RUN rm -rf /tmp/*

USER $user:$group

EXPOSE 3128/tcp

ENTRYPOINT [ "/entrypoint.sh" ]

