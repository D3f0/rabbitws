FROM jfloff/alpine-python:2.7

ENV NB_USER jupyter
ENV HOME /home/$NB_USER

RUN apk --no-cache add netcat-openbsd

RUN pip install virtualenv && rm -rf /root/.cache
RUN adduser -D $NB_USER
RUN chown -R $NB_USER $HOME
USER $NB_USER
WORKDIR $HOME

RUN virtualenv $HOME/venv
ENV PATH $HOME/venv/bin:$PATH

RUN pip install jupyter ipywidgets && rm -rf $HOME/.cache/
# Enable ipywidgets
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN pip install paho-mqtt
# Install Jupyter notebook as jovyan
RUN mkdir -p $HOME/.jupyter
ADD ipython_notebook_config.py $HOME/.jupyter/jupyter_notebook_config.py

RUN mkdir notebooks

WORKDIR $HOME/notebooks
ADD ./demos demos
ENTRYPOINT jupyter-notebook
