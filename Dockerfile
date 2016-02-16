from node:latest

run npm install -g yo generator-hubot coffee-script
run apt-get -q update

ENV BOT_USER=rrr

run adduser --disabled-password --gecos "" ${BOT_USER}
run echo "${BOT_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/${BOT_USER}
user ${BOT_USER}

run mkdir -p ${HOME}/bot
add . ${HOME}/bot

workdir ${HOME}/bot
run npm install

env HUBOT_SHELLCMD_KEYWORD bash

# env HUBOT_SLACK_TOKEN=xxxxxxxxxxxxxxxx 

cmd REDIS_URL=redis://${RRR_BRAIN_PORT_6379_TCP_ADDR}:${RRR_BRAIN_PORT_6379_TCP_PORT}/hubot_brain bin/hubot --adapter slack

