#!/bin/sh
mkdir -p /etc/apt/keyrings
apt-get -y update
apt-get -y install mc git
git clone https://github.com/ansokoloff/myenviroinments.git /tmp/env
chown -R arctic:arctic /tmp/env
rm -rf /tmp/env/.git
rm -rf /tmp/env/.gitignore
rsync -a /tmp/env/ /home/arctic
usermod -a -G docker arctic