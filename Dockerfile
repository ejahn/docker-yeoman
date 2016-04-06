# pull base image
FROM ubuntu:latest
MAINTAINER Erik Jahn <mail@erikjahn.de>

# Install updates, get packages
RUN sudo apt-get update -y -qq
RUN sudo apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# Install ruby, yeoman, etc.
RUN sudo apt-get install -y python git git-core

# install ruby
RUN apt-get install -y -qq ruby-dev
RUN apt-get install make

# install compass
RUN gem install --no-rdoc --no-ri compass

RUN sudo npm install -g yo generator-angular generator-gulp-angular generator-webapp grunt-cli bower gulp

# Add a yeoman user because grunt doesn't like being root
RUN adduser --disabled-password --gecos "" yeoman; \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER yeoman

# Install oh my zsh
# RUN sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Create a directory for the app
RUN sudo mkdir -p /app && cd $_
#ENV HOME /app
WORKDIR /app

EXPOSE 9000

# Always run as the yeoman user
#    CMD ['/bin/bash']
