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
RUN apt-get install -y git-flow

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

# Puppeteer support
# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update && apt-get install -yq libgconf-2-4
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb
