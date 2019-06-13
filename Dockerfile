FROM armv7/armhf-ubuntu

#RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install nodejs npm node-semver
RUN apt-get install -y build-essential libavahi-compat-libdnssd-dev libudev-dev libpam0g-dev nodejs

RUN mkdir -p /opt/iobroker/
WORKDIR /opt/iobroker/
RUN npm install iobroker --unsafe-perm && echo $(hostname) > .install_host
ADD scripts/run.sh run.sh
RUN chmod +x run.sh
VOLUME /opt/iobroker/

EXPOSE 8081
CMD /opt/iobroker/run.sh
