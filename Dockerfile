# using most recent version of Ubuntu - available versions here:
#   https://hub.docker.com/_/ubuntu/
FROM ubuntu:artful
# hides warnings from apt-get commands about TERM not being set
# using 'ARG' so this environment variable is only set during image creation
ARG DEBIAN_FRONTEND=noninteractive

# copies in Bash profile to:
# - customize prompt
# - load SSH key imported from host
# - switch to /src directory where working directory is mapped
COPY container.bashrc /root/.bashrc

# updates packages and installs a utility (apt-utils) to suppress other warnings
# from apt-get calls later on
# the warning itself will actually be displayed during the installation of
# apt-utils since it isn't yet install
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y curl

RUN apt-get install -y git

# installs the most recent version of Node 9. 2> /dev/null is used to suppress
# terminal output about download rates
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - 2> /dev/null
RUN apt-get install -y nodejs

# dependencies for headless Chrome to function
RUN apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 \
libcairo2 libcups2 libdbus-1-3 \
libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 \
libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 \
libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates \
fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# installs the most recent version of the AWS CLI. 2> /dev/null is used to
# suppress terminal output about download rates
RUN curl -O https://bootstrap.pypa.io/get-pip.py 2> /dev/null
RUN apt-get install -y python-pip libpython-dev
RUN pip install awscli
