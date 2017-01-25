FROM centos:6
MAINTAINER Sebastian Katzer "katzer@appplant.de"

RUN    yum -y update \
    && yum -y groupinstall "Development Tools" \
    && yum -y install libgcc glibc-devel libgcc.i686 glibc-devel.i686 \
    && yum -y install curl tar \
    && yum -y clean all

RUN    mkdir -p /opt/ruby-2.2.3/ \
    && curl -s https://s3.amazonaws.com/pkgr-buildpack-ruby/current/centos-6/ruby-2.2.3.tgz | tar xzC /opt/ruby-2.2.3/
ENV PATH /opt/ruby-2.2.3/bin:$PATH

WORKDIR /home/mruby/code
ENV GEM_HOME /home/mruby/code/.gem/

ENV PATH $GEM_HOME/bin/:$PATH
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
