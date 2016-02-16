RUN cd hubot; npm install

CMD cd hubot; bin/hubot --adapter slack

from node:latest

run npm install -g yo generator-hubot coffee-script
run apt-get -q update
run apt-get -qy install git-core   
# run apt-get -qy install redis-server

# create user for robot
run adduser --disabled-password --gecos "" rrr
run echo "rrr ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/rrr
user rrr

# using a preexisting robot
git clone https://github.com/formigarafa/rrr.git /home/rrr/rrr

workdir /home/rrr/rrr
run npm install

# starting the robot

# service redis-server start

env HUBOT_SHELLCMD_KEYWORD bash
#env HUBOT_SLACK_TOKEN=xoxb-21353567475-iip03ihwJib5CImPFSh3zdlL 

cmd bin/hubot --adapter slack

