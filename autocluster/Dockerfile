FROM rabbitmq:3.6-management

ENV RABBITMQ_AUTOCLUSTER 0.6.1

RUN  apt-get update -y && apt-get install -y wget && \
wget -qO- https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/$RABBITMQ_AUTOCLUSTER/autocluster-$RABBITMQ_AUTOCLUSTER.tgz  | tar xvz -C /plugins/ --strip 1

RUN apt-get purge -y wget

RUN rabbitmq-plugins enable --offline autocluster

ADD autocluster.config /etc/rabbitmq/
ADD rabbitmq.config /etc/rabbitmq/

RUN chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /etc/rabbitmq