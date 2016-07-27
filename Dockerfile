# pull base image
FROM ubuntu:14.04
MAINTAINER Erik Jahn <mail@erikjahn.de>

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install updates, get packages
RUN apt-get update --fix-missing -y -qq
RUN sudo apt-get install -y build-essential libssl-dev curl wget

# Install ruby, yeoman, etc.
RUN sudo apt-get install -y python git git-core

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4

# Install nvm with node and npm
RUN wget -qO- https://raw.githubusercontent.com/xtuple/nvm/master/install.sh | sudo bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm install -g npm

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# install ruby
RUN apt-get install -y -qq ruby-dev
RUN apt-get install make

# install compass
RUN gem install --no-rdoc --no-ri compass

# Install yeoman, generators and dependencies
RUN npm install -g grunt-cli bower gulpjs/gulp-cli yo generator-angular generator-gulp-angular generator-webapp generator-fountain-webapp

# Add a yeoman user because grunt doesn't like being root
RUN adduser --disabled-password --gecos "" yeoman; \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER yeoman

# Create a directory for the app
RUN sudo mkdir -p /app && cd $_
ENV HOME /app
WORKDIR /app
CMD ["zsh"]

EXPOSE 9000
