FROM busybox

# Add packeges
ADD https://github.com/kelseyhightower/confd/releases/download/v0.14.0/confd-0.14.0-linux-amd64 /confd
ADD https://github.com/rancher/giddyup/releases/download/v0.19.0/giddyup /giddyup
RUN chmod +x /confd && \
    chmod u+x /giddyup

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
ADD ./run.sh /run.sh
ADD ./dockerentry.sh /dockerentry.sh

VOLUME /data/confd
VOLUME /opt/rancher/bin
VOLUME /etc/rabbitmq

ENTRYPOINT ["/dockerentry.sh"]
CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
