#!/bin/sh
mkdir -p /etc/apt/keyrings
apt-get -y remove docker docker-engine docker.io containerd runc
apt-get -y update
apt-get -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
chmod a+r /etc/apt/keyrings/docker.gpg
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin mc git
mkdir -p /home/arctic/env
git clone https://github.com/ansokoloff/myenviroinments.git /tmp/env
find /tmp/env/ -type f -exec chown -R arctic:arctic {} \;
find /tmp/env/ -type d -exec chown -R arctic:arctic {} \;
rm -rf /tmp/env/.git
rm -rf /tmp/env/.gitignore
find /tmp/env/ -type f -exec cp {} /home/arctic/ \;
find /tmp/env/ -type d -exec cp {} /home/arctic/ \;
usermod -a -G docker arctic