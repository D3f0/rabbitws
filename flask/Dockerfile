FROM alpine


# Python stuff
RUN apk add --no-cache bash git nginx uwsgi uwsgi-python py-pip \
    && pip install --upgrade pip \
    && pip install virtualenv
# JS Stuff
RUN apk --update add git nodejs && rm -rf /var/cache/apk/* && \
    npm install -g bower && \
    echo '{ "allow_root": true }' > /root/.bowerrc

RUN adduser -D user
WORKDIR /home/user/src
USER user

RUN virtualenv /home/user/venv
ADD ./src/requirements.txt /home/user/src/requirements.txt
RUN /home/user/venv/bin/pip install -r /home/user/src/requirements.txt

# SVG
ADD ./src/static/svg /home/user/src/static/svg
# Bower
ADD ./src/static/.bowerrc /home/user/src/static/.bowerrc
ADD ./src/static/bower.json /home/user/src/static/bower.json

USER root
RUN mkdir /home/user/src/static/bower \
    && chown user /home/user/src/static/bower

USER user
RUN cd /home/user/src/static/ && bower install

# Favicon
ADD ./src/static/favicon /home/user/src/static/favicon


ADD ./src/app /home/user/src/app
ADD ./src/templates /home/user/src/templates

USER root
RUN chown -R user:user /home/user/src

USER user

CMD ["/home/user/venv/bin/python", "app/webapp.py"]


