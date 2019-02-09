# using most recent version of Ubuntu - available versions here:
#   https://hub.docker.com/_/ubuntu/
FROM ubuntu:bionic
# hides warnings from apt-get commands about TERM not being set
# using 'ARG' so this environment variable is only set during image creation
ARG DEBIAN_FRONTEND=noninteractive

# copies in Bash profile to:
# - customize prompt
# - load SSH key & AWS credentials imported from host
# - switch to /src directory where working directory is mapped
COPY container.bashrc /root/.bashrc

# updates packages and installs a utility (apt-utils) to suppress other warnings
# from apt-get calls later on
# the warning itself will actually be displayed during the installation of
# apt-utils since it isn't yet installed
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y curl

RUN apt-get install -y vim
RUN apt-get install -y git

# installs the most recent version of the AWS CLI
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install awscli

# installs the most recent version of Node 11 and the things it depends on. 2>
# /dev/null is used to suppress terminal output about parsing apt-get keys
RUN apt-get install -y gnupg2
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - 2> /dev/null
RUN apt-get install -y nodejs
