FROM rabbitmq:latest


RUN rabbitmq-plugins enable rabbitmq_mqtt
ADD rabbitmq_web_mqtt-3.6.x-14dae543.ez \
    /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/
RUN rabbitmq-plugins enable rabbitmq_web_mqtt
RUN rabbitmq-plugins enable rabbitmq_management
