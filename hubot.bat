# creating fresh robot
mkdir rrr
cd rrr
yo hubot
npm install -S hubot-script-shellcmd
cp -R node_modules/hubot-script-shellcmd/bash .
# then add more scripts to bash/handlers

# build image
sudo docker build -t rrr_bot . 

# start a redis brain for rrr_bot
sudo docker run --name rrr_redis -d redis

# start rrr_bot
sudo docker run --link=rrr_redis:rrr_brain -d -e HUBOT_SLACK_TOKEN=xxxxxxxxx rrr_bot

