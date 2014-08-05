FROM ubuntu:14.04
MAINTAINER Max Droog Hayes

############################################
# Install pure-ftpd

RUN apt-get -y update

# install package building helpers
RUN apt-get -y --force-yes install dpkg-dev debhelper

# install dependancies
RUN apt-get -y build-dep pure-ftpd

# build from source
RUN mkdir /tmp/pure-ftpd/ && \
cd /tmp/pure-ftpd/ && \
apt-get source pure-ftpd && \
cd pure-ftpd-* && \
sed -i '/^optflags=/ s/$/ --without-capabilities/g' ./debian/rules && \
dpkg-buildpackage -b -uc

# install the new deb files
RUN dpkg -i /tmp/pure-ftpd/pure-ftpd-common*.deb
RUN apt-get -y install openbsd-inetd
RUN dpkg -i /tmp/pure-ftpd/pure-ftpd_*.deb

# Prevent pure-ftpd upgrading
RUN apt-mark hold pure-ftpd pure-ftpd-common

# setup ftpgroup and ftpuser
RUN groupadd ftpgroup
RUN useradd -g ftpgroup -d /dev/null -s /etc ftpuser

RUN (echo sample; echo sample) | pure-pw useradd sample -u ftpuser -d /home/ftpusers/sample
RUN pure-pw mkdb

################################################
# startup
CMD ["/usr/sbin/pure-ftpd","-c","30","-C","1","-l","puredb:/etc/pure-ftpd/pureftpd.pdb","-x","-E","-j","-R","&"]

EXPOSE 21/tcp
