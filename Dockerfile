#FROM --platform=linux/arm/v7 ubuntu:latest 
FROM docker.io/library/ubuntu:latest@sha256:ea8f467d512068a1e52494d5b2d959a9307a35682633d0b5d481e79c914c627f
#RUN mkdir ./build
# && cd ./build \
# && wget https://github.com/HeyuX10Automation/heyu/archive/refs/tags/v2.10.3.tar.gz \
# && tar xf v2.10.3.tar.gz \
# && cd heyu-2.10.3 \
# && sh ./Configure -nocm17a \
# && make \
# && sudo make install \
# && cd .. \
# && rm -r ./build \
# && mkdir -p /usr/local/var/tmp/heyu \
# && mkdir -p /usr/local/var/lock \
# && chmod 777 -R /usr/local/var/tmp/heyu \
# && chmod 777 -R /usr/local/var/lock

VOLUME /etc/heyu

#RUN ["/bin/sh", "-c", "mkdir -p /usr/local/bin/heyu-run"]
#RUN mkdir /usr/local/bin/heyu-mqtt
#RUN chmod 777 -R /usr/local/bin/heyu-run
#RUN chmod 777 -R /usr/local/bin/heyu-mqtt
COPY heyu-run.sh /opt/heyu
COPY heyu-mqtt.pl /opt/heyu
#RUN chmod 777 /usr/local/bin/heyu-run.sh
#RUN chmod 777 /usr/local/bin/heyu-mqtt.pl

ENV PERL_ANYEVENT_VERBOSE=7

#ENTRYPOINT ["sh","/run.sh"]
CMD /opt/heyu/heyu-run.sh


#FROM arm32v7/nginx:alpine-perl
#FROM avastsoftware/alpine-perl
#MAINTAINER Kevin Eye <kevineye@gmail.com>

#RUN apk -U add curl build-base perl-sub-name \
# && curl -sL https://cpanmin.us | perl - --no-wget --notest AnyEvent::MQTT AnyEvent::Run \
# && mkdir /build \
# && cd /build \
# && curl -LsSO http://www.heyu.org/download/heyu-2.11-rc1.tar.gz \
# && echo 'f02fa53b866343f05d57a2ac87c7f7b39c786295 *heyu-2.11-rc1.tar.gz' | sha1sum -c - \
# && tar xzf heyu-2.11-rc1.tar.gz \
# && cd heyu-2.11-rc1 \
# && ./configure --sysconfdir=/etc \
# && make \
# && make install \
# && cd / \
# && apk --purge del curl build-base \
# && rm -rf /build /root/.cpanm /etc/ssl /var/cache/apk/* /lib/apk/db/*

#RUN cp -r /etc/heyu /etc/heyu.default \
# && mkdir -p /usr/local/var/tmp/heyu \
# && mkdir -p /usr/local/var/lock \
# && chmod 777 -R /usr/local/var/tmp/heyu \
# && chmod 777 -R /usr/local/var/lock

#VOLUME /etc/heyu

#COPY heyu-run.sh /usr/local/bin/heyu-run
#COPY heyu-mqtt.pl /usr/local/bin/heyu-mqtt

#RUN chmod 777 -R /usr/local/bin/heyu-run
#RUN chmod 777 -R /usr/local/bin/heyu-mqtt

#ENV PERL_ANYEVENT_VERBOSE=7

#RUN echo 'Call heyu-run command'

#ENTRYPOINT ["sh","/run.sh"]
#CMD sh /usr/local/bin/heyu-run/heyu-run.sh
