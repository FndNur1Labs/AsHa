FROM ubuntu:xenial

LABEL maintainer.0="nur1labs (@nur1labs)" 

RUN useradd -r mubdi \
  && apt-get update -y \
  && apt-get install -y curl gnupg gosu \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV ARIA_VERSION=4.5.0.5
ENV ARIA_DATA=/home/mubdi/.aria
ENV PATH=/opt/mubdi-${ARIA_VERSION}/bin:$PATH

RUN curl -SL https://mubdi.nur1labs.net/nur1labs-releases.asc | gpg --batch --import \
  && curl -SLO https://mubdi.nur1labs.net/bin/mubdi-core-${ARIA_VERSION}/zEtA.asc \
  && curl -SLO https://mubdi.nur1labs.net/bin/mubdi-core-${ARIA_VERSION}/aria-${ARIA_VERSION}-ubuntu-v4.5.0.4.gz \
  && gpg --verify zEtA.asc \
  && grep " aria-${ARIA_VERSION}-ubuntu-v4.5.0.4.gz\$" zEtA.asc | sha256sum -c - \
  && tar -xzf *.tar.gz -C /opt \
  && rm *.tar.gz *.asc

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["/home/mubdi/.aria"]

EXPOSE 43088 43188 43001 43101 43002 43102

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ariad"]