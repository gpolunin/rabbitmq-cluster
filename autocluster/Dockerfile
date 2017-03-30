FROM rabbitmq:3.6-management

ENV RABBITMQ_AUTOCLUSTER 0.6.1 \
    RABBITMQ_USE_LONGNAME=true \
    AUTOCLUSTER_LOG_LEVEL=debug \
    AUTOCLUSTER_CLEANUP=true \
    CLEANUP_INTERVAL=60 \
    CLEANUP_WARN_ONLY=false \
    AUTOCLUSTER_TYPE=k8s

ADD plugins/*.ez /plugins/

RUN rabbitmq-plugins enable --offline autocluster

ADD autocluster.config /etc/rabbitmq/
ADD rabbitmq.config /etc/rabbitmq/

RUN chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /etc/rabbitmq