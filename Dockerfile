FROM moul/python-dev
MAINTAINER Manfred Touron <m@42.am>

ENV DEBIAN_FRONTEND noninteractive
ENV APPDIR /app
ENV DJANGO_SETTINGS_MODULE config

RUN apt-get -qqy update
RUN adduser --gecos 'py' --disabled-password py
RUN apt-get -qqy install \
    libxml2-dev libxslt1-dev expat libevent-dev wget \
    texlive texlive-latex-extra language-pack-en \
    unzip python-dev git

RUN mkdir -p $APPDIR && cd /tmp && \
    wget -q --no-check-certificate https://github.com/rtfd/readthedocs.org/archive/master.zip

ADD config /
RUN /bin/rtd-install.sh

EXPOSE 8000
VOLUME ["/app"]
CMD ["/bin/rtd-start.sh"]
