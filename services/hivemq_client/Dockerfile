FROM httpd

RUN apt-get update -qq && apt-get install -qq -y unzip
ADD https://github.com/hivemq/hivemq-mqtt-web-client/archive/master.zip /tmp
RUN cd /usr/local/apache2/htdocs \
    && unzip /tmp/master.zip \
    && rm /tmp/master.zip \
    && mv /usr/local/apache2/htdocs/hivemq-mqtt-web-client-master/* /usr/local/apache2/htdocs/
