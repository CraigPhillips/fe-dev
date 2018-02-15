FROM node:latest

COPY container.bashrc /root/.bashrc

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN apt-get update
RUN apt-get install -y python-pip libpython-dev
RUN pip install awscli
