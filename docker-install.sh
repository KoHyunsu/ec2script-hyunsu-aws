#!/bin/bash -xe
exec > >(sudo tee /var/log/user-data.log|sudo sh -c "logger -t user-data -s 2>/dev/console") 2>&1

sudo yum update -y
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
