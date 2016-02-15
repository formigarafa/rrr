
npm install -g yo generator-hubot coffee-script
apt-get -q update
apt-get -qy install git-core redis-server
service redis-server start
adduser --disabled-password --gecos "" yeoman; echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers



su - yeoman

mkdir myhubot
cd myhubot
yo hubot

git config --global user.email 'formigarafa@gmail.com'
git config --global user.name 'Rafael Santos'

git init
git add .
git commit -m 'init'

./bin/slack

HUBOT_SLACK_TOKEN=xoxb-21353567475-iip03ihwJib5CImPFSh3zdlL ./bin/hubot --adapter slack
