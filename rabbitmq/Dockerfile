FROM rabbitmq:latest


RUN rabbitmq-plugins enable rabbitmq_mqtt
ADD rabbitmq_web_mqtt-3.6.x-14dae543.ez \
    /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/

ADD https://bintray.com/rabbitmq/community-plugins/download_file?file_path=rabbitmq_auth_backend_http-3.6.x-1b27d722.ez \
    /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/rabbitmq_auth_backend_http.ez

RUN chown -R rabbitmq /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/
RUN rabbitmq-plugins enable rabbitmq_web_mqtt
RUN rabbitmq-plugins enable rabbitmq_auth_backend_http
RUN rabbitmq-plugins enable rabbitmq_management

ADD ./rabbitmq.config /etc/rabbitmq/rabbitmq.config

