FROM alpine


RUN apk add --no-cache bash git nginx uwsgi uwsgi-python py-pip \
    && pip install --upgrade pip \
    && pip install virtualenv

RUN adduser -D user
USER user
RUN virtualenv /home/user/venv

WORKDIR /home/user/src

COPY ./src /home/user/src
RUN /home/user/venv/bin/pip install -r /home/user/src/requirements.txt
CMD ["/home/user/venv/bin/python", "webapp.py"]


