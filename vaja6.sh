#!/bin/bash
mkdir Dekstop
mkdir Dokuments
mkdir Dowloads
mkdir pictures
mkdir videos
for i in {1..5}
do
mkdir folder$i
done
eadarray -t a <users.txt
for i in "${a[@]}"
do
sudo adduser "$i"
sudo usermod -aG sudo "$i"
done
sudo apt-get update -y
sudo apt-get install -y net-tools
sudo apt install nginx -y
sudo apt-get update -y
apt-get install -y ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
