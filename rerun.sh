#!/bin/bash
sudo docker build -t rrr_bot .
sudo docker rm -f -v rrr_bot
sudo docker run --name rrr_bot --link=rrr_redis:rrr_brain -d -e HUBOT_SLACK_TOKEN=${HUBOT_SLACK_TOKEN} rrr_bot
