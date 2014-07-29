FROM ubuntu

MAINTAINER Gilles Vivies <gilles.vivies@gmail.com>

RUN apt-get update -q

# node
RUN apt-get install -y nodejs
RUN apt-get install -y npm

RUN sudo ln /usr/bin/nodejs /usr/bin/node

RUN npm install -g grunt-cli
RUN echo 'eval "$(grunt --completion=bash)"' >> ~/.bashrc
RUN sudo npm install -g bower
RUN npm cache clean

RUN apt-get install -y git

RUN npm update -g npm

# Install Scrumberry
# ADD ./src/scrumberry /scrumberry
RUN git clone      https://github.com/scrumberry/scrumberry.git

RUN cd /scrumberry && \
    bower --allow-root install && \
    npm install && \
    npm install assetmanager@0.1.2 # this fix a assetmanager version issue

ADD ./src/run.sh /scrumberry/run.sh
RUN chmod +x /scrumberry/*.sh

EXPOSE 3000
CMD ["/scrumberry/run.sh"]