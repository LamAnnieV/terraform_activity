#!/bin/bash

echo "Running updates..."
sudo apt-get update

echo " "

echo "Installing java..."
sudo apt-get install -y fontconfig openjdk-17-jre

echo "Installing Jenkins..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get install -y jenkins

sudo systemctl start jenkins

exit 0
