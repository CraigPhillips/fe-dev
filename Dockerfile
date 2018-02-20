FROM ubuntu:artful

COPY container.bashrc /root/.bashrc

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN apt-get install -y python-pip libpython-dev
RUN pip install awscli
