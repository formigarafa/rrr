# create container
sudo docker run --rm -it node /bin/bash

# setup environment
npm install -g yo generator-hubot coffee-script
apt-get -q update
apt-get -qy install git-core redis-server
service redis-server start

# create user for robot
adduser --disabled-password --gecos "" yeoman; echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
su - yeoman

# creating fresh robot
mkdir rrr
cd rrr
yo hubot
npm install -S hubot-script-shellcmd
cp -R node_modules/hubot-script-shellcmd/bash .
# then add more scripts to bash/handlers

# using a preexisting robot
git clone https://github.com/formigarafa/rrr.git
cd rrr

# starting the robot
HUBOT_SHELLCMD_KEYWORD='bash' HUBOT_SLACK_TOKEN=xoxb-21353567475-iip03ihwJib5CImPFSh3zdlL ./bin/hubot --adapter slack


docker run --name rrr_redis -d redis



#
sudo docker run -l rrr_redis:rrr_brain -d -e HUBOT_SLACK_TOKEN=xxxx rrr_bot
